import 'package:medicinetime/controller/forgetpassword/resetpassword_controller.dart';
import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtextbodyauth.dart';
import 'package:medicinetime/view/widget/auth/customtextformauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('إعادة تعيين كلمة المرور',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
        body:GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) =>


                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                  widget:
                  Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text:  " كلمة المرور الجديدة"),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "  ادخل كلمة المرور الجديدة"),
            const SizedBox(height: 15),
            CustonTextFormAuth(
              isNumber: false ,
              obscureText: true,

              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hinttext: "ادخل كلمة المرور",
              iconData: Icons.lock_outline,
              labeltext: "19".tr,
              // mycontroller: ,
            ),
            CustonTextFormAuth(
              isNumber: false ,
              obscureText: true,

              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.repassword,
              hinttext: "اعد ادخال كلمة المرور",
              iconData: Icons.lock_outline,
              labeltext: "كلمة المرور",
              // mycontroller: ,
            ),
            CustomButtomAuth(
                text: "حفظ",
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),))
    );
  }
}