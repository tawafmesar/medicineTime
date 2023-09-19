import 'package:medicinetime/controller/auth/forgetpassword_controller.dart';
import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtextbodyauth.dart';
import 'package:medicinetime/view/widget/auth/customtextformauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validinput.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("هل نسيت كلمة المرور",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "فحص البريد الالكتروني",),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
              // please Enter Your Email Address To Recive A verification code
                text:
                "الرجاء ادخال البريد لتلقي رمز التحقق"),
            const SizedBox(height: 15),
            CustonTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 3, 40, "email");
              },
              mycontroller: controller.email,
              hinttext:  "ادخل البريد الالكتروني",
              iconData: Icons.email_outlined,
              labeltext:"البريد الالكتروني",
              // mycontroller: ,
            ),
            CustomButtomAuth(text: "فحص", onPressed: () {
              controller.goToVerfiyCode() ;
            }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
