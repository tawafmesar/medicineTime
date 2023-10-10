

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dailydosage_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/customlistdailydosage.dart';

class DailyDosagePage extends StatelessWidget {
  const DailyDosagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DailyDosageControllerImp());
    return Scaffold(
      body: Stack(
          children: [
            GetBuilder<DailyDosageControllerImp>(
                builder: ((controller) => ListView(children: [
                  Container(
                      child: const Center(
                          child: Text(
                            "الجرعات اليومية",
                            style: TextStyle(fontSize: 40),
                          )
                      )
                  ),
                  Container(
                    color: AppColor.grey2,

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                      Icon(
                                          Icons.check_circle_outline,
                                          size: 23.0, color: AppColor.secoundColor,),
                                    SizedBox(width: 5,),
                                    Text(
                                      'تم اخذ الجرعة اليوم',
                                      style: TextStyle(
                                        color: AppColor.primaryColor, // Use a similar color
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold, // Apply a bold font weight
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 27,),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:  [
                                    Icon(
                                      Icons.radio_button_unchecked_sharp,
                                      size: 23.0, color: AppColor.hourHandEndColor,),
                                    SizedBox(width: 5,),
                                    Text(
                                      'لم يتم اخذ الجرعة اليوم',
                                      style: TextStyle(
                                        color: AppColor.primaryColor, // Use a similar color
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold, // Apply a bold font weight
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(

                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:3.2
                            ,   crossAxisCount: 1),
                        itemBuilder: (context, index) {
                          return CustomListDailyDosage(controller.data[index])
                          ;
                        },
                      )
                  )
                ]
                )
                )
            )
          ]),
    );
  }
}



