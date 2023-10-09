
import 'package:flutter/material.dart';
import 'package:medicinetime/view/screen/dailydosage.dart';
import 'package:medicinetime/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
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


  List<Widget> listPage = [
    const HomePage(),
  const DailyDosagePage(),
   const VitalSign(),
   LogoutScreen(),
  ];

  List  titlebottomappbar = [
    "الأدوية" ,
    "الحالة الصحية" ,
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
  logout() async {
    myServices.sharedPreferences.setString("step","1") ;

    // Use Get.offNamed in an asynchronous context to avoid build phase issues
    await Future.delayed(Duration.zero); // Add this line to schedule the navigation in the next frame
    Get.offNamed(AppRoute.login);
  }

  @override
  goToAlarmPage() {
    Get.toNamed(AppRoute.alarmpage);
  }
}
