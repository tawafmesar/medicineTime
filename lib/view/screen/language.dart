import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/core/constant/routes.dart';
import 'package:medicinetime/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds and then change language and navigate
    Future.delayed(const Duration(seconds: 2), () {
      Get.find<LocaleController>().changeLang("ar");
      Get.offNamed(AppRoute.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: 'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/11/06/010534_1346719.gif',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
