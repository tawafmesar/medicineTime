import 'package:medicinetime/core/class/statusrequest.dart';
import 'package:medicinetime/core/functions/handingdatacontroller.dart';
import 'package:medicinetime/core/services/services.dart';
import 'package:medicinetime/data/datasource/remote/dailydosage_data.dart';
import 'package:medicinetime/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/constant/routes.dart';
import '../data/datasource/remote/addmedicine_data.dart';
import '../data/datasource/remote/medicine_data.dart';
import '../data/datasource/remote/removmedicine_data.dart';
import '../data/model/medicinemodel.dart';

abstract class  DailyDosageController extends GetxController {
  getData() ;
  addDailyDosage(String itemsid);

}

class DailyDosageControllerImp extends DailyDosageController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MedicineData favoriteData = MedicineData(Get.find());

  List data = [];

//  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  DailyDosageData dailyDosageData = DailyDosageData(Get.find());

  late TextEditingController medicine_name;
  late TextEditingController medicine_type;
  late TextEditingController HealthCondition;
  String? users_id;

  late StatusRequest statusRequest = StatusRequest.none;

  AddMedicineData addMedicineData = AddMedicineData(Get.find());





  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MedicineModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  @override
  addDailyDosage(String itemsid) async {
    //  data.clear();
    statusRequest = StatusRequest.loading;
    var response = await dailyDosageData.addData(itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حفظ الجرعة ",style: TextStyle(color: Colors.cyanAccent),));
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
    getData();

    users_id = myServices.sharedPreferences.getString("id") ;

    super.onInit();
  }

  @override
  void dispose() {


    super.dispose();
  }




}

