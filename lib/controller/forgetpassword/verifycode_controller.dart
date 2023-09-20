import 'package:medicinetime/core/class/statusrequest.dart';
import 'package:medicinetime/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToRestPassword(String verifycode);

}
class VerifyCodeControllerImp extends VerifyCodeController {


  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData= VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {

  }

  @override
  goToRestPassword(verifycode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword,
            arguments: {
              "email" : email

            }
        );
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
  }




  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();

  }

  @override
  void dispose() {

    super.dispose();
  }

}