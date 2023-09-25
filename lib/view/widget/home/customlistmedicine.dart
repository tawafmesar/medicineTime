

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../controller/medicineview_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/medicinemodel.dart';

class CustomListMedicine extends GetView<MedicineViewControllerImp> {
  final MedicineModel medicineModel;
  // final bool active;

  const CustomListMedicine(this.medicineModel, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicineViewControllerImp());

    return  Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust vertical margin for spacing
      elevation: 4, // Add a shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Add rounded corners
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: GradientTemplate.gradientTemplate[2].colors, // Choose a gradient from your template
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: GradientTemplate.gradientTemplate[2].colors.last.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)), // Apply the same radius as the shape
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adjust padding for content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicineModel.medicineName!,
                style: TextStyle(
                  color: AppColor.primaryTextColor, // Use the alarm-style text color
                  fontSize: 20, // Increase the font size for the title
                  fontWeight: FontWeight.w700, // Apply a bold font weight
                ),
              ),
              SizedBox(height: 10), // Add spacing between title and type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    medicineModel.medicineType!,
                    style: TextStyle(
                      color: AppColor.clockBG, // Use a similar color
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Apply a bold font weight
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.removeFavorite(medicineModel.medicineId!) ;
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: AppColor.minHandEndColor, // Use a similar color
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


























