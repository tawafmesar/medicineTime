import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
            child: const Center(
                child: Text(
                  "أضافة الأدوية هنا",
                  style: TextStyle(fontSize: 10),
                )
            )
        ),
        MaterialButton(onPressed: (){
          Get.toNamed(AppRoute.addmedicine);

        },
            child: Text('اضافة')
        )

      ],
    );
  }
}