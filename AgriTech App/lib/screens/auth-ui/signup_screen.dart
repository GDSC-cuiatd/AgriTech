// ignore_for_file: prefer_const_constructors, prefer_const_literals_
//to_create_immutables,
//avoid_unnecessary_containers, file_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../controllers/sign_up_controller.dart';
import '../../utils/app_constant.dart';
import '../bottom_naviagtion.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: AppConstant.appMainColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  width: Get.width / 2.5,
                  height: Get.height / 5,
                  decoration: BoxDecoration(
                      color: AppConstant.appTextColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    height: 250,
                    width: 250,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register with us! ',
                        style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Text(
                        'Your Informtion is safe\n with us',
                        style: TextStyle(
                            color: AppConstant.appTextColor, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppConstant.appTextColor,
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: username,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppConstant.appTextColor,
                        hintText: 'UserName',
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userPhone,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppConstant.appTextColor,
                        hintText: 'Phone',
                        prefixIcon: Icon(Icons.phone),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userCity,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppConstant.appTextColor,
                        hintText: 'City',
                        prefixIcon: Icon(Icons.location_pin),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => TextFormField(
                        obscureText: signUpController.isPasswordVisible.value,
                        controller: userPassword,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppConstant.appTextColor,
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                signUpController.isPasswordVisible.toggle();
                              },
                              child: signUpController.isPasswordVisible.value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  width: Get.width / 1.1,
                  height: Get.height / 17,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 18),
                    ),
                    onPressed: () async {
                      //.offAll(() => BottomNavigatioScreen());
                      String name = username.text.trim();
                      String email = userEmail.text.trim();
                      String phone = userPhone.text.trim();
                      String city = userCity.text.trim();
                      String password = userPassword.text.trim();
                      String userDeviceToken = '';

                      if (name.isEmpty ||
                          email.isEmpty ||
                          phone.isEmpty ||
                          city.isEmpty ||
                          password.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Please enter all details',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      } else {
                        UserCredential? userCredential =
                            await signUpController.signUpMethod(
                          name,
                          email,
                          phone,
                          city,
                          password,
                          userDeviceToken,
                        );

                        if (userCredential != null) {
                          Get.snackbar(
                            'Verification email sent.',
                            'Please check your email.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );

                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => SignInScreen());
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                          color: AppConstant.appSecondaryColor, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignInScreen()),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppConstant.appSecondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
