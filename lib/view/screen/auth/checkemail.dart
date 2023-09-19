import 'package:medicinetime/controller/auth/checkemail_controller.dart';
import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtextbodyauth.dart';
import 'package:medicinetime/view/widget/auth/customtextformauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller =
    Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("فحص البريد الالكتروني",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          CustomTextTitleAuth(text:  "تم انشاء الحساب بنجاح"),
          const SizedBox(height: 10),
          CustomTextBodyAuth(
              text:
              "الرجاء ادخال البريد لتلقي رمز التحقق"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            mycontroller: controller.email,
            hinttext: "ادخل البريد الالكتروني",
            iconData: Icons.email_outlined,
            labeltext: "البريد الالكتروني",
            // mycontroller: ,
          ),
          CustomButtomAuth(text: "فحص", onPressed: () {
            controller.goToSuccessSignUp() ;
          }),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}