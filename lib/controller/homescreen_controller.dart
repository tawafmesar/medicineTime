
import 'package:flutter/material.dart';
import 'package:medicinetime/view/screen/dailydosage.dart';
import 'package:medicinetime/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/updatedaily_data.dart';
import '../view/screen/auth/logout.dart';
import '../view/screen/vitalsign.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
  goToAlarmPage();

  logout();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  MyServices myServices = Get.find();

  UpdateDaily updatee = UpdateDaily(Get.find());

  List data = [];
  late StatusRequest statusRequest;



  List<Widget> listPage = [
    const HomePage(),
  const DailyDosagePage(),
   const VitalSign(),
   LogoutScreen(),
  ];

  List  titlebottomappbar = [
    "الأدوية" ,
    "الجرعات اليومية" ,
    "علامات حيوية" ,
    "تسجيل خروج"
  ] ;


  List  iconsbottomappbar = [
    "assets/images/home.png" ,
    "assets/images/health.png" ,
    "assets/images/sign.png",
    "assets/images/logout.png"
  ] ;

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  @override

  updateDaily() async {
    statusRequest = StatusRequest.loading;
    var response = await updatee.updatedaily();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  logout() async {
    updateDaily();

    myServices.sharedPreferences.setString("step","1") ;

    await Future.delayed(Duration.zero); // Add this line to schedule the navigation in the next frame
    Get.offNamed(AppRoute.login);
  }

  @override
  goToAlarmPage() {
    Get.toNamed(AppRoute.alarmpage);
  }
}
