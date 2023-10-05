import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart'; // Import the TimePicker package
import 'package:medicinetime/data/datasource/remote/alarm/alarmview_data.dart';
import 'package:medicinetime/data/model/alarmmodel.dart';

import '../core/constant/routes.dart';
import '../data/datasource/remote/addmedicine_data.dart';
import '../data/datasource/remote/alarm/addalarm_data.dart';
import '../data/datasource/remote/alarm/removealarm_data.dart';
import '../data/datasource/remote/medicine_data.dart';
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

  AlarmViewData alarmViewData = AlarmViewData(Get.find());

  List data = [];

  MedicineData favoriteData = MedicineData(Get.find());
  List<String> medicinedata = [];
  List alarmdata = [];

  MyServices myServices = Get.find();

  late TextEditingController alarm_title;
  late TextEditingController alarm_time;
  String? users_id;

  late StatusRequest statusRequest = StatusRequest.none;

  AddAlarmData addAlarmData = AddAlarmData(Get.find());

  RemoveAlarmData removeAlarmData = RemoveAlarmData(Get.find());

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
          getData();

          Get.offNamed(AppRoute.alarmpage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      // Handle validation errors if needed
    }
  }




  getDataMedicine() async {
    medicinedata.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List<dynamic> responsedata = response['data'];
        for (var item in responsedata) {
          String medicineName = item['medicine_name'];
          medicinedata.add(medicineName);
        }
        print("medicinedata");
        print(medicinedata);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  getData() async {
    alarmdata.clear();
    statusRequest = StatusRequest.loading;
    var response = await alarmViewData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        alarmdata.addAll(responsedata.map((e) => AlarmModel.fromJson(e)));
        print("alarmdata");

        print(alarmdata);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  removeAlarm(String itemsid) async {
    //  data.clear();
    statusRequest = StatusRequest.loading;
    var response = await removeAlarmData.removeAlarmData(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف  التنبية  ",style: TextStyle(color: Colors.cyanAccent),));
        getData();

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();

  }


  @override
  void onInit() {
    getDataMedicine();
    getData();
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
