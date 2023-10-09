

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dailydosage_controller.dart';
import '../../core/class/handlingdataview.dart';
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
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(

                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:2.6
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



