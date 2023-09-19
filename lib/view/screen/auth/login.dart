import 'package:flutter/material.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/LogoAuth.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import 'package:get/get.dart';

import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('تسجيل الدخول',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const LogoAuth(),
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "اهلا بك "),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
              "قم بتسجيل الدخول عبر البريد الألكتروني وكلمة المرور الخاصة بك"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            mycontroller: controller.email,
            hinttext: "ادخل بريدك الألكتروني",
            iconData: Icons.email_outlined,
            labeltext: "البريد الألكتروني",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.password,
            hinttext: "ادخل كلمة مرورك",
            iconData: Icons.lock_outline,
            labeltext: "كلمة المرور",
            // mycontroller: ,
          ),
          InkWell(
            onTap: () {
              controller.goToForgetPassword();
            },
            child:   Text(
              "هل نسيت كلمة المرور",
              textAlign: TextAlign.right,
            ),
          ),
          CustomButtomAuth(text: "تسجيل الدخول", onPressed: () {}),
          const SizedBox(height: 40),
          CustomTextSignUpOrSignIn(
            textone: "ليس لديك حساب ؟ ",
            texttwo: "انشاء حساب",
            onTap: () {
              controller.goToSignUp();
            },
          )
        ]),
      ),
    );
  }
}