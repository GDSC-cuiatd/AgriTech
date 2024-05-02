import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../bottom_naviagtion.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black.withOpacity(0.5),
        leading: GestureDetector(
            onTap: () {
              Get.offAll(() => BottomNavigatioScreen());
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 40,
            ),
            const Center(
              child: Text(
                'Agritech',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10),
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'About Us',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Container(
                height: Get.height / 10,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red, width: 1)),
                child: const Center(
                  child: Text(
                    'We are Providing solution of plant disease\n Detection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'About Our Project',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Container(
                height: Get.height / 10,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xff1877F2), width: 1)),
                child: const Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''
Its help real time to detect the diseases\nusing Ai models for Plants''',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Our Team',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Container(
                height: Get.height / 5,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xff34A853), width: 1)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 10, vertical: Get.height / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/raees.png'),
                          ),
                          Text(
                            'Raees',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('AI/Ml'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/muneer.png'),
                          ),
                          Text(
                            'Muneer',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('FLUTTER'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Container(
                height: Get.height / 5,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xff34A853), width: 1)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 10, vertical: Get.height / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/hamad.png'),
                          ),
                          Text(
                            'Hammad',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('UI/UX'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/awais.png'),
                          ),
                          Text(
                            'Awais',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('Website/Github'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
