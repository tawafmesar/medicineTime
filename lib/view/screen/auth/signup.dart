import 'package:medicinetime/controller/auth/signup_controller.dart';
import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtextbodyauth.dart';
import 'package:medicinetime/view/widget/auth/customtextformauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:medicinetime/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('إنشاء حساب ',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "اهلا بك"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
              "يمكنك انشاء الحساب عبر البريد الألكتروني و بعض المعلومات عنك"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            mycontroller: controller.username,
            hinttext: "ادخل اسم المستخدم",
            iconData: Icons.person_outline,
            labeltext: "اسم المستخدم",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.email,
            hinttext: "ادخل البريد الالكتروني",
            iconData: Icons.email_outlined,
            labeltext: "البريد الألكتروني",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.phone,
            hinttext: "ادخل رقم الجوال  ",
            iconData: Icons.phone_android_outlined,
            labeltext: "رقم الجوال",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.password,
            hinttext: "ادخل كلمة المرور",
            iconData: Icons.lock_outline,
            labeltext: " كلمة المرور",
            // mycontroller: ,
          ),

          CustomButtomAuth(text: "انشاء", onPressed: () {
            controller.signUp();
          }),
          const SizedBox(height: 40),
          CustomTextSignUpOrSignIn(
            textone: "هل لديك حساب مسبقاً ؟ ",
            texttwo: " الذهاب لتسجيل الدخول ",
            onTap: () {
              controller.goToSignIn();
            },
          ),
        ]),
      ),
    );
  }
}