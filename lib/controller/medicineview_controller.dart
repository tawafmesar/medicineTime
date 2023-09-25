import 'package:medicinetime/core/class/statusrequest.dart';
import 'package:medicinetime/core/functions/handingdatacontroller.dart';
import 'package:medicinetime/core/services/services.dart';
import 'package:medicinetime/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../data/datasource/remote/medicine_data.dart';
import '../data/datasource/remote/removmedicine_data.dart';
import '../data/model/medicinemodel.dart';

abstract class  MedicineViewController extends GetxController {
  getData() ;
  removeFavorite(String itemsid);
}

class MedicineViewControllerImp extends MedicineViewController {

  MedicineData favoriteData = MedicineData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  RemoveMedicineData removeMedicineData = RemoveMedicineData(Get.find());

//  List datare = [];





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
  removeFavorite(String itemsid) async {
  //  data.clear();
    statusRequest = StatusRequest.loading;
    var response = await removeMedicineData.removeMedicineData(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة "));
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
    super.onInit();
  }








}

