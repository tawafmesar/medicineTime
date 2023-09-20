import 'package:medicinetime/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController{
  login();
  goToSigUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  String? emailsignup;
  String? passwordssignup;

  bool isshopassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshopassword = !isshopassword;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {

          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(title: "تنبــة", middleText: "يرجى التأكد , البريد الألكتروني او كلمة المرور غير صحيح");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      // Form validation failed
    }
  }

  @override
  goToSigUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {


    email = TextEditingController();
    password = TextEditingController();

    super.onInit();

    emailsignup = Get.arguments?['emailsignup'];
    passwordssignup = Get.arguments?['passwordssignup'];

    email.text = emailsignup ?? '';
    password.text = passwordssignup ?? '';
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}