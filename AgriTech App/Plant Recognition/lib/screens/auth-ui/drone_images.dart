import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../bottom_naviagtion.dart';
import 'drone_ready_screen.dart';
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
        centerTitle: true,
        title: Text(
          'Take Aeraial Images',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black.withOpacity(0.5),
        leading: GestureDetector(
            onTap: () {
              Get.offAll(() => BottomNavigatioScreen());
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Take Aeraial',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            Text(
              'Images',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.width / 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => DroneReadyScreen());
                },
                child: Image(image: AssetImage('assets/startDrone.png'))),
            SizedBox(
              height: Get.width / 20,
            ),
            Text(
              'On the Drone',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.width / 15,
            ),
            Image(image: AssetImage('assets/mainp.png')),
          ],
        ),
      ),
    );
  }
}
