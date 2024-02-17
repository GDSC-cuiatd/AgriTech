import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class ImageHistory extends StatelessWidget {
  String img;
  String desc;
  ImageHistory({required this.img, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 7,
      width: Get.width,
      child: Card(
        color: Color(0xff00322D),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image(
                image: AssetImage(img),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: AppConstant.appTextColor, fontSize: 18),
                  ),
                ),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(color: AppConstant.appTextColor),
                  child: Text(desc),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
