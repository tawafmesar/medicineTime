
import 'package:flutter/material.dart';
import 'package:medicinetime/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/auth/logout.dart';

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
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("الحالة الصحية"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("علامات حيوية"))],
    ),
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
  logout() {
    myServices.sharedPreferences.setString("step","1") ;

    Get.offNamed(AppRoute.login);

  }

  @override
  goToAlarmPage() {
    Get.toNamed(AppRoute.alarmpage);
  }
}
