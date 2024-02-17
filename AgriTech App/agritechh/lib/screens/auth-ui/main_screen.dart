// ignore_for_file: prefer_const_constructors

import 'package:agritechh/screens/auth-ui/drone_images.dart';
import 'package:agritechh/screens/auth-ui/history.dart';
import 'package:agritechh/screens/auth-ui/upload_pic.dart';
import 'package:agritechh/screens/auth-ui/welcome_screen.dart';
import 'package:agritechh/widgets/image_historyreusable_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math';
import '../../utils/app_constant.dart';

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
        // backgroundColor: Colors.black,
        title: Text('Agri Tech'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () async {
                  GoogleSignIn _googleSigIn = GoogleSignIn();
                  _googleSigIn.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                child: Icon(Icons.logout)),
          )
        ],
      ),
      body: Column(
        children: [
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
            margin: EdgeInsets.only(left: 80),
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.off(() => UploadPictureScreen());
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
                      Get.off(() => DroneImages());
                    },
                    child: Image(
                      image: AssetImage('assets/aa4.png'),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            height: Get.height / 15,
          ),
          Image(image: AssetImage('assets/mainp.png'))
        ],
      ),
    );
  }
}
