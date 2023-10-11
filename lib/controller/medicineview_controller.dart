import 'package:medicinetime/core/class/statusrequest.dart';
import 'package:medicinetime/core/functions/handingdatacontroller.dart';
import 'package:medicinetime/core/services/services.dart';
import 'package:medicinetime/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/constant/routes.dart';
import '../data/datasource/remote/addmedicine_data.dart';
import '../data/datasource/remote/medicine_data.dart';
import '../data/datasource/remote/removmedicine_data.dart';
import '../data/model/medicinemodel.dart';

abstract class  MedicineViewController extends GetxController {
  getData() ;
  removeFavorite(String itemsid);
  add();

}

class MedicineViewControllerImp extends MedicineViewController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MedicineData favoriteData = MedicineData(Get.find());

  List data = [];

//  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  RemoveMedicineData removeMedicineData = RemoveMedicineData(Get.find());

  late TextEditingController medicine_name;
  late TextEditingController medicine_type;
  late TextEditingController HealthCondition;
  late TextEditingController isDaily;

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
            messageText: const Text("تم حذف  الدواء  ",style: TextStyle(color: Colors.cyanAccent),));
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
  add() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await addMedicineData.postdata(
          medicine_name.text, medicine_type.text, HealthCondition.text , isDaily.text, users_id!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          medicine_name.clear();
          medicine_type.clear();
          HealthCondition.clear();
          isDaily.clear();

          Get.rawSnackbar(
              title: "اشعار",
              messageText: const Text("تم اضافة دواء",style: TextStyle(color: Colors.cyanAccent),));
          getData();
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
    getData();

    medicine_name = TextEditingController() ;
    medicine_type = TextEditingController() ;
    HealthCondition = TextEditingController();
    isDaily = TextEditingController();


    users_id = myServices.sharedPreferences.getString("id") ;

    super.onInit();
  }

  @override
  void dispose() {
    medicine_name.dispose();
    medicine_type.dispose();
    HealthCondition.dispose();
    isDaily.dispose();

    super.dispose();
  }




}

