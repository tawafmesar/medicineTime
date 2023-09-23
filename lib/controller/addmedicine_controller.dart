import 'package:medicinetime/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/addmedicine_data.dart';

abstract class AddMedicineController extends GetxController {
  add();
}


class AddMedicineControllerImp extends AddMedicineController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  late TextEditingController medicine_name;
  late TextEditingController medicine_type;
  late TextEditingController HealthCondition;
  String? users_id;

  StatusRequest statusRequest = StatusRequest.none;

  AddMedicineData addMedicineData = AddMedicineData(Get.find());

  List data = [];


  @override
  add() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await addMedicineData.postdata(
          medicine_name.text, medicine_type.text, HealthCondition.text, users_id!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.homepage);

        } else {
          Get.defaultDialog(title: "تنبيــة" , middleText: "يرجى التأكد , البريد الألكتروني او رقم الهاتف موجود مسبقاً") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }




  @override
  void onInit() {
    medicine_name = TextEditingController() ;
    medicine_type = TextEditingController() ;
    HealthCondition = TextEditingController();

    users_id = myServices.sharedPreferences.getString("id") ;

    super.onInit();
  }

  @override
  void dispose() {
    medicine_name.dispose();
    medicine_type.dispose();
    HealthCondition.dispose();

    super.dispose();
  }
}