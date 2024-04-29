// ignore_for_file: prefer_const_constructors, prefer_const_literals
// _to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';
import 'start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => StartPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.appMainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            alignment: Alignment.center,
            child: Container(
              width: Get.width / 2,
              height: Get.height / 4,
              decoration: BoxDecoration(
                  // color: AppConstant.appTextColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Image(
                image: AssetImage('assets/splash.png'),
                fit: BoxFit.contain,
                height: 350,
                width: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
