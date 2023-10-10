import 'package:medicinetime/core/constant/color.dart';
import 'package:medicinetime/view/widget/auth/custombuttonauth.dart';
import 'package:medicinetime/view/widget/auth/customtexttitleauth.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/alarm_controller.dart';
import '../../../core/class/handlingdataview.dart';

class AddAlarm extends StatefulWidget {

  const AddAlarm({Key? key}) : super(key: key);

  @override
  _AddAlarnState createState() => _AddAlarnState();
}

class _AddAlarnState extends State<AddAlarm> {


  String? selectedOption;




  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Extract the hour and minute components
    int hour = now.hour;
    int minute = now.minute;

    // Create a Time object
    Time _time = Time(hour: hour, minute: minute);

    Get.put(AlarmControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'اضافة تنبية',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<AlarmControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      const CustomTextTitleAuth(text: " تفاصيل التنبية"),
                      const SizedBox(height: 10),
                      const SizedBox(height: 15),


                      // Add the dropdown select field
                      DropdownButtonFormField<String>(
                        value: selectedOption, // Initially selected option (can be null).
                        decoration: InputDecoration(
                          hintText: 'ادخل الدواء المراد التنبيه له',
                          hintStyle: const TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text('الدواء'),
                          ),
                          suffixIcon: InkWell(child: Icon(Icons.medical_information)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            controller.alarm_title.text = newValue ?? ''; // Assign the selected option to controller.medicine_type2
                          });
                        },
                        items: controller.medicinedata.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10,),


                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          void onTimeChanged(Time newTime) {
                            setState(() {
                              _time = newTime;

                              controller.alarm_time.text = _time.format(context); // Convert Time to string and assign it


                            });
                          }
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: _time,
                              onChange: onTimeChanged,
                              minuteInterval: TimePickerInterval.FIVE,
                              // Optional onChange to receive value as DateTime
                              onChangeDateTime: (DateTime dateTime) {
                                // print(dateTime);

                                debugPrint("[debug datetime]:  $dateTime");


                              },
                            ),
                          );




                        },
                        child: const Text(
                          "حدد وقت التنبية",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),



                      CustomButtomAuth(text: "حفظ", onPressed: () {
//                        print('Selected Option: $selectedOption');

                             print('Selected Option: controller.alarm_time');
                             print(controller.alarm_time);

                             print('Selected Option: _time ');

                             print(_time);

                        controller.add();
                      }),
                    ],
                  ),
                ),
              ))),
    );
  }
}
