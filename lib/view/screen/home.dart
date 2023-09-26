

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/medicineview_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customlistmedicine.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicineViewControllerImp());
    return Scaffold(
      body: Stack(
          children: [
            GetBuilder<MedicineViewControllerImp>(
                builder: ((controller) => ListView(children: [
                  Container(
                      child: const Center(
                          child: Text(
                            "الأدوية",
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
                          return CustomListMedicine(controller.data[index])
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
                  Get.toNamed(AppRoute.addmedicine);                },
                child: Icon(Icons.add),
              ),
            ),
          ]),
    );
  }
}



