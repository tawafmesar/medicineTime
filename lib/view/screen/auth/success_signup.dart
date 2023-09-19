import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('نجاح',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              )),
          Text("تهانينا",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("تم إنشاء الحساب بنجاح"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "لتسجيل الدخول",
                onPressed: () {
                  // controller.signUp();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}