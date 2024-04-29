import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/image_historyreusable_row.dart';
import '../bottom_naviagtion.dart';
import 'main_screen.dart';

class HostoryScreen extends StatefulWidget {
  const HostoryScreen({super.key});

  @override
  State<HostoryScreen> createState() => _HostoryScreenState();
}

class _HostoryScreenState extends State<HostoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.offAll(() => BottomNavigatioScreen());
            },
            child: Icon(Icons.arrow_back_ios_new)),
        title: Text('Uploaded Picture'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageHistory(
                img: 'assets/plant.png',
                desc: 'Infectious plant diseases are caused by bacteria'),
            ImageHistory(
                img: 'assets/plant.png',
                desc: 'Infectious plant diseases are caused by bacteria'),
            ImageHistory(
                img: 'assets/plant.png',
                desc: 'Infectious plant diseases are caused by bacteria'),
            ImageHistory(img: 'assets/plant.png', desc: ''),
          ],
        ),
      ),
    );
  }
}
