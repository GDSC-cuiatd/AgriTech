import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottom_naviagtion.dart';
import 'drone_images.dart';

class DroneReadyScreen extends StatelessWidget {
  const DroneReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Drone Ready',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black.withOpacity(0.5),
        leading: GestureDetector(
            onTap: () {
              Get.offAll(() => DroneImages());
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
              'Getting Ready',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: Get.width / 20,
            ),
            GestureDetector(
                onTap: () {},
                child: Image(image: AssetImage('assets/readyDrone.png'))),
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
