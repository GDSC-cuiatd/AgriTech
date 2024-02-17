import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_naviagtion.dart';
import 'main_screen.dart';

class DroneImages extends StatefulWidget {
  const DroneImages({super.key});

  @override
  State<DroneImages> createState() => _DroneImagesState();
}

class _DroneImagesState extends State<DroneImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.offAll(() => BottomNavigatioScreen());
            },
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Text(
            'Take Aeraial Images',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
