import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart'; // Import the TimePicker package

import '../core/constant/routes.dart';
import '../data/datasource/remote/addmedicine_data.dart';
import '../data/datasource/remote/alarm/addalarm_data.dart';
import '../data/model/medicinemodel.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';

abstract class AlarmController extends GetxController {
  add();
}

class AlarmControllerImp extends AlarmController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List data = [];

  MyServices myServices = Get.find();

  late TextEditingController alarm_title;
  late TextEditingController alarm_time;
  String? users_id;

  late StatusRequest statusRequest = StatusRequest.none;

  AddAlarmData addAlarmData = AddAlarmData(Get.find());

  @override
  add() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addAlarmData.postdata(
          alarm_title.text, alarm_time.text, users_id!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          alarm_title.clear();
          alarm_time.clear();
          Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text(
              "تم اضافة التنبية",
              style: TextStyle(color: Colors.cyanAccent),
            ),
          );
          Get.offNamed(AppRoute.homepage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      // Handle validation errors if needed
    }
  }

  @override
  void onInit() {
    alarm_title = TextEditingController();
    alarm_time = TextEditingController();
    users_id = myServices.sharedPreferences.getString("id");
    super.onInit();
  }

  @override
  void dispose() {
    alarm_title.dispose();
    alarm_time.dispose();
    super.dispose();
  }
}
