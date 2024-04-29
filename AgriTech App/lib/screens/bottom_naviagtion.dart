import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../utils/app_constant.dart';
import 'auth-ui/about.dart';
import 'auth-ui/history.dart';
import 'auth-ui/main_screen.dart';
import 'contact_us.dart';
import 'history_screen.dart';

class BottomNavigatioScreen extends StatefulWidget {
  const BottomNavigatioScreen({super.key});

  @override
  State<BottomNavigatioScreen> createState() => _BottomNavigatioScreenState();
}

class _BottomNavigatioScreenState extends State<BottomNavigatioScreen> {
  int _selectedTab = 0;

  List _pages = [
    MainScreen(),
    //HistoryScreen(),
    HostoryScreen(),
    // Center(
    //   child: Text("About"),
    // ),
    ContactUs(),
    // Center(
    //   child: Text("Contact"),
    // ),
    AboutScreen()
  ];

  // ignore: always_declare_return_types
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(),
      body: _pages[_selectedTab],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black, // Make background transparent
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: AppConstant.appSecondaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3_outlined, size: 30),
                label: 'History'),
            BottomNavigationBarItem(
                icon: badges.Badge(
                    badgeContent: Text('3'),
                    child: Icon(
                      Icons.notifications_active_outlined,
                      size: 30,
                    )),
                label: 'Contact'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30), label: 'About'),
          ],
        ),
      ),
    );
  }
}
