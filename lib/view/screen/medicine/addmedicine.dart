import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtextformauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/medicineview_controller.dart';
import '../../../core/class/handlingdataview.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  String? selectedOption; // Store the selected option here

  @override
  Widget build(BuildContext context) {
    Get.put(MedicineViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'اضافة دواء',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<MedicineViewControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      const CustomTextTitleAuth(text: " تفاصيل الدواء"),
                      const SizedBox(height: 10),
                      const SizedBox(height: 15),
                      CustonTextFormAuth(
                        isNumber: false,
                        valid: (val) {
//                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.medicine_name,
                        hinttext: "ادخل اسم الدواء",
                        iconData: Icons.receipt,
                        labeltext: "اسم الدواء",
                      ),
                      CustonTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                         // return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.HealthCondition,
                        hinttext: "ادخل الحالة الصحية للدواء",
                        iconData: Icons.sick,
                        labeltext: "الحالة الصحية",
                      ),

                      DropdownButtonFormField<String>(
                        value: selectedOption,
                          decoration: InputDecoration(
                              hintText:'ادخل شكل الدواء او نوعة',
                              hintStyle: const TextStyle(fontSize: 14),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                              label: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 9),
                                  child: Text('شكل الدواء')),
                              suffixIcon: InkWell(child: Icon(Icons.medical_information)),
                              border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                          )
                          ,
                        onChanged: (String? newValue) {
                          setState(() {
                            controller.medicine_type.text = newValue ?? '';
                          });
                        },
                        items: <String>[
                          'أقراص (حبوب)',
                          'شراب',
                          'حقن',
                          'مرهم أو كريم',
                          'فتحة العين (قطرة)',

                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20,),

                      DropdownButtonFormField<String>(
                        value: selectedOption, // Set the selected value as 'daily' or 'notdaily'
                        decoration: InputDecoration(
                          hintText: 'ادخل اوقات الجرعة',
                          hintStyle: const TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text('اوقات الجرعات'),
                          ),
                          suffixIcon: InkWell(child: Icon(Icons.calendar_month)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue == 'جرعة يومية') {
                              controller.isDaily.text = '1';
                            } else if (newValue == 'جرعة غير يومية') {
                              controller.isDaily.text = '2';
                            }
                          });
                        },
                        items: <String>[
                          'جرعة يومية',
                          'جرعة غير يومية',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                      CustomButtomAuth(text: "حفظ", onPressed: () {
//                        print('Selected Option: $selectedOption');

                        controller.add();
                      }),
                    ],
                  ),
                ),
              ))),
    );
  }
}
