// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary
//_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/google_signin_controller.dart';
import '../../utils/app_constant.dart';
import 'signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: Get.height,
              width: Get.width,
              child: Image(
                image: AssetImage('assets/baground.png'),
                fit: BoxFit.cover,
              )),
          Positioned(
              top: 100,
              left: 80,
              child: Image(image: AssetImage('assets/WtoAgriGrow.png'))),
          Positioned(
              top: 450,
              left: 80,
              child: Text(
                'Make Easy Farming with fast\n delivery at your door',
                style: TextStyle(
                    fontSize: 20,
                    color: AppConstant.appTextColor,
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
            left: 30,
            top: 550,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ' sign in with',
                  style:
                      TextStyle(color: AppConstant.appTextColor, fontSize: 18),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 120,
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 600,
            left: 40,
            child: Container(
              alignment: Alignment.center,
              width: Get.width / 1.2,
              height: Get.height / 14,
              decoration: BoxDecoration(
                color: AppConstant.appTextColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                icon: Image.asset(
                  'assets/google.png',
                  width: Get.width / 12,
                  height: Get.height / 12,
                ),
                label: Text(
                  'Sign in with google',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: () {
                  _googleSignInController.signInWithGoogle();
                  //Get.offAll(() => BottomNavigatioScreen());
                },
              ),
            ),
          ),
          Positioned(
              left: 40,
              top: 680,
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 14,
                decoration: BoxDecoration(
                  color: AppConstant.appTextColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Sign in with email',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  onPressed: () {
                    Get.to(() => SignInScreen());
                  },
                ),
              ))
        ],
      ),
    );
  }
}
