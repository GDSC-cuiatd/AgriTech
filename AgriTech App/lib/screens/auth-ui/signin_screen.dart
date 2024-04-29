// ignore_for_file: prefer_const_constructors,
//prefer_const_literals_to_create_immutables, avoid_unnecessary_containers,
//unused_local_variable, unnecessary_null_comparison, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../controllers/get_user_data_controller.dart';
import '../../controllers/signin_controller.dart';
import '../../utils/app_constant.dart';
import '../bottom_naviagtion.dart';
import 'forget_password.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
          backgroundColor: AppConstant.appMainColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
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
                ),
                SizedBox(
                  height: Get.height / 35,
                ),
                Image(
                  image: AssetImage('assets/sign.png'),
                ),
                SizedBox(
                  height: Get.height / 30,
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
                  //  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => TextFormField(
                        obscureText: signInController.isPasswordVisible.value,
                        controller: userPassword,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppConstant.appTextColor,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                signInController.isPasswordVisible.toggle();
                              },
                              child: signInController.isPasswordVisible.value
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetPasswordScreen());
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: AppConstant.appSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 30,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width / 1.1,
                    height: Get.height / 17,
                    decoration: BoxDecoration(
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: AppConstant.appTextColor, fontSize: 18),
                      ),
                      onPressed: () async {
                        String email = userEmail.text.trim();
                        String password = userPassword.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar(
                            'Error',
                            'Please enter all details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else {
                          UserCredential? userCredential =
                              await signInController.signInMethod(
                                  email, password);

                          var userData = await getUserDataController
                              .getUserData(userCredential!.user!.uid);

                          if (userCredential != null) {
                            if (userCredential.user!.emailVerified) {
                              Get.snackbar(
                                'Success',
                                'Successfully login',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondaryColor,
                                colorText: AppConstant.appTextColor,
                              );
                              Get.offAll(() => BottomNavigatioScreen());
                            } else {
                              Get.snackbar(
                                'Error',
                                'Please verify your email before login',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondaryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please try again',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          color: AppConstant.appSecondaryColor, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignUpScreen()),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: AppConstant.appSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    });
  }
}
