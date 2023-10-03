

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicinetime/view/widget/alarm/customlistalarm.dart';

import '../../../controller/alarm_controller.dart';
import '../../../controller/medicineview_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
import '../../widget/home/customlistmedicine.dart';



class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AlarmControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
          children: [
            GetBuilder<AlarmControllerImp>(
                builder: ((controller) => ListView(children: [
                  Container(
                      child: const Center(
                          child: Text(
                            "التنبيهات",
                            style: TextStyle(fontSize: 40),
                          )
                      )
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(

                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.alarmdata.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:2.6
                            ,   crossAxisCount: 1),
                        itemBuilder: (context, index) {
                          return CustomListAlarm(controller.alarmdata[index])
                          ;
                        },
                      )
                  )
                ]
                )
                )
            ),
            Positioned(
              bottom: 36.0, // Adjust the position as needed
              right: 26.0, // Adjust the position as needed
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRoute.addalarmpage);
                  },
                child: Icon(Icons.add),
              ),
            ),
          ]),
    );
  }
}