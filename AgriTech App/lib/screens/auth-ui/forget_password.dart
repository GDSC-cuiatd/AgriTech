import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../controllers/forget_password_controller.dart';
import '../../utils/app_constant.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgerPasswordController forgerPasswordController =
      Get.put(ForgerPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondaryColor,
          centerTitle: true,
          title: Text(
            'Forget Password',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Resset Password',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      // ignore: lines_longer_than_80_chars
                      'Please enter your email address\n to request password reset'),
                ),
              ),
              SizedBox(
                height: Get.height / 45,
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
              SizedBox(
                height: Get.height / 20,
              ),
              Material(
                child: Container(
                  width: Get.width / 1.1,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    child: Text(
                      'Forget',
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 20),
                    ),
                    onPressed: () async {
                      String email = userEmail.text.trim();

                      if (email.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Please enter all details',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      } else {
                        String email = userEmail.text.trim();
                        forgerPasswordController.ForgetPasswordMethod(email);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
