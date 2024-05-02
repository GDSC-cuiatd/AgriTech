// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:math';
import '../../custom_widgets/custom_drawer.dart';
import '../../utils/app_constant.dart';
import '../../widget/plant_recogniser.dart';
import 'about.dart';
import 'drone_images.dart';
import 'history.dart';
import 'welcome_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.5),
        title: Text(
          'Agri Tech',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () async {
                  GoogleSignIn _googleSigIn = GoogleSignIn();
                  _googleSigIn.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 60,
            ),
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(AppConstant.appMainName,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(
              height: Get.height / 20,
            ),
            Container(
              //margin: Edg
              //eInsets.only(left: 80),
              child: Center(
                child: Column(children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width / 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.off(() => UploadPictureScreen());
                          Get.to(() => PlantRecogniser());
                        },
                        child: Image(
                          image: AssetImage('assets/aa1.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => DroneImages());
                        },
                        child: Image(
                          image: AssetImage('assets/aa2.png'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width / 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => HostoryScreen());
                        },
                        child: Image(
                          image: AssetImage('assets/aa3.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => AboutScreen());
                        },
                        child: Image(
                          image: AssetImage('assets/aa4.png'),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: Get.height / 15,
            ),
            Image(image: AssetImage('assets/mainp.png'))
          ],
        ),
      ),
    );
  }
}
