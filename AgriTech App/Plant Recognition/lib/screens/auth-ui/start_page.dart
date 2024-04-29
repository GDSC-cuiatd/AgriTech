// ignore_for_file: prefer_const_constructors, prefer_const_literals
// _to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';
import 'welcome_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.appMainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 14,
            ),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Container(
                width: Get.width / 2,
                height: Get.height / 4,
                decoration: BoxDecoration(
                    color: AppConstant.appTextColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 15,
            ),
            Text(
              'Plant Detection',
              style: TextStyle(
                  color: AppConstant.appTextColor,
                  fontSize: 29.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 200),
              child: Column(
                children: [
                  Text(
                    'Providing best way to',
                    style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Detect plant diseases',
                    style: TextStyle(
                        color: Color.fromARGB(255, 112, 91, 91),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Move with us on beautiful journey',
                    style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => WelcomeScreen());
                    },
                    child: Container(
                      height: Get.height / 15,
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                          color: AppConstant.appSecondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppConstant.appTextColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
