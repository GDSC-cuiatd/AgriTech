import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_drawer.dart';
import '../custom_widgets/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isloading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black.withOpacity(0.4),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.jpg'), // Adjust the path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // var userData = snapshot.data!.data();
                // if (userData == null) {
                //   return Text('User data not found');
                // }
                // nameController.text = userData['name'];
                // phoneController.text = userData['phone'];
                // addressController.text = userData['address'];
                var userData = snapshot.data!.data();
                if (userData == null) {
                  return Text('User data not found');
                }

// Use the null-aware operators to ensure no null values
//are assigned to the controllers
                nameController.text = userData['name'] ?? '';
                phoneController.text = userData['phone'] ?? '';
                addressController.text = userData['address'] ?? '';
                return Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage: userData['userImg'] != null
                                ? NetworkImage(userData['userImg'])
                                // Corrected to use user['userImg']
                                : null, // Fallback to default if no URL
                            //provided
                            child: userData['userImg'] == null
                                ? Text(
                                    getInitials(userData['username'] ??
                                        ''), // Safe access
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  )
                                : null, // Don't display initials if the image
                            //is available
                          ),
                          SizedBox(height: 10),
                          Text(
                            userData['username'] ?? 'Name not available',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(height: 30),
                          CustomTextField(
                            labelText: 'Name',
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          //SizedBox(height: 20),

                          // CustomTextField(
                          //   labelText: 'Phone',
                          //   controller: phoneController,
                          //   validator: (value) {
                          //     // Regular expression for Pakistani phone number
                          //     RegExp pakistanPhoneRegExp =
                          //         RegExp(r'^\+?92[0-9]{10}$');

                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your phone number';
                          //     } else if (!pakistanPhoneRegExp.hasMatch
                          //(value)) {
                          //       return 'Please enter a valid phone number';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Address',
                            controller: addressController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => isloading.isFalse
                                ? ElevatedButton(
                                    onPressed: () {
                                      _saveProfile(context);
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _saveProfile(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Get the updated values from the text controllers
      // String newName = nameController.text;
      // String newPhone = phoneController.text;
      // String newAddress = addressController.text;
      String newName = nameController.text.trim();
      String newPhone = phoneController.text.trim();
      String newAddress = addressController.text.trim();

      try {
        isloading.value = true;
        String uid = FirebaseAuth.instance.currentUser!.uid;

        // Update the Firestore document
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'name': newName,
          'phone': newPhone,
          'address': newAddress, // Update the image URL in Firestore
        });

        // Show a success message or perform any additional actions
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Profile updated successfully'),
        ));
      } catch (e) {
        // Show an error message if the update fails
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to update profile: $e'),
        ));
      } finally {
        isloading.value = false;
      }
    }
  }
}
