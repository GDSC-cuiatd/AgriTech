import 'package:agritechh/screens/auth-ui/about.dart';
import 'package:agritechh/screens/auth-ui/history.dart';
import 'package:agritechh/screens/auth-ui/main_screen.dart';
import 'package:agritechh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavigatioScreen extends StatefulWidget {
  const BottomNavigatioScreen({super.key});

  @override
  State<BottomNavigatioScreen> createState() => _BottomNavigatioScreenState();
}

class _BottomNavigatioScreenState extends State<BottomNavigatioScreen> {
  int _selectedTab = 0;

  List _pages = [
    MainScreen(),
    HostoryScreen(),
    Center(
      child: Text("About"),
    ),
    Center(
      child: Text("Contact"),
    ),
    AboutScreen()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: AppConstant.appSecondaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_outlined, size: 30), label: "History"),
          BottomNavigationBarItem(
              icon: badges.Badge(
                  badgeContent: Text("3"),
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                  )),
              label: "Contact"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: "Settings",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: "About"),
        ],
      ),
    );
  }
}
