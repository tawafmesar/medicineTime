import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: const [
          SizedBox(height: 20),
          CustomTextTitleAuth(text: "Welcome Back"),
          SizedBox(height: 10),
          CustomTextBodyAuth(
              text:
              "Sign In With Your Email And Password OR Continue With Social Media"),
          SizedBox(height: 65),
          CustonTextFormAuth(
            hinttext: "Enter Your Email",
            iconData: Icons.email_outlined,
            labeltext: "Email",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            hinttext: "Enter Your Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
            // mycontroller: ,
          )  ,
        ]),
      ),
    );
  }
}