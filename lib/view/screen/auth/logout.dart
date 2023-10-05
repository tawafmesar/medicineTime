import 'package:flutter/material.dart';

import '../../../controller/homescreen_controller.dart';
import 'package:get/get.dart';
class LogoutScreen extends StatefulWidget {
  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  final HomeScreenControllerImp controller = Get.find<HomeScreenControllerImp>();

  @override
  void initState() {
    super.initState();

    controller.logout();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل خروج"),
      ),
      body: Center(
        child: Text("Logout screen content goes here"),
      ),
    );
  }
}
