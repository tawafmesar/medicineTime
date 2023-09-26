
import 'package:flutter/material.dart';
import 'package:medicinetime/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Settings"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Favorite"))],
    )
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
}
