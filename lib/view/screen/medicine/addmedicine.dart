import 'package:medicinetime/controller/auth/signup_controller.dart';
import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtextbodyauth.dart';
import 'package:medicinetime/view/widget/auth/customtextformauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:medicinetime/view/widget/auth/textsignup.dart';
import 'package:medicinetime/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/addmedicine_controller.dart';
import '../../../controller/medicineview_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/alertexitapp.dart';


class AddMedicine extends StatelessWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicineViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('اضافة دواء',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<MedicineViewControllerImp>(
          builder:
              (controller) =>

              HandlingDataViewRequest(statusRequest: controller.statusRequest,
                  widget:
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        const CustomTextTitleAuth(text: "اهلا بك"),
                        const SizedBox(height: 10),
                        const SizedBox(height: 15),
                        CustonTextFormAuth(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 3, 20, "username");
                          },
                          mycontroller: controller.medicine_name,
                          hinttext: "ادخل اسم الدواء",
                          iconData: Icons.person_outline,
                          labeltext: "اسم الدواء",

                          // mycontroller: ,
                        ),
                        CustonTextFormAuth(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 3, 20, "username");
                          },
                          mycontroller: controller.medicine_type,
                          hinttext: "ادخل النوع",
                          iconData: Icons.email_outlined,
                          labeltext: "النوع",
                          // mycontroller: ,
                        ),
                        CustonTextFormAuth(
                          isNumber: true,

                          valid: (val) {
                            return validInput(val!, 3, 20, "username");
                          },
                          mycontroller: controller.HealthCondition,
                          hinttext: "ادخل الحالة الصحية للدواء",
                          iconData: Icons.phone_android_outlined,
                          labeltext: "الحالة الصحية",
                          // mycontroller: ,
                        ),

                        CustomButtomAuth(text: "حفظ", onPressed: () {
                          controller.add();
                        }),

                      ]),
                    ),
                  )
              )),
    );
  }
}