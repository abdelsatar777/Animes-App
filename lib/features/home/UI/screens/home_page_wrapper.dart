import 'package:animes_app/core/resource/app_colors.dart';
import 'package:animes_app/features/home/UI/screens/home_screen.dart';
import 'package:animes_app/features/home/UI/screens/search_screen.dart';
import 'package:animes_app/features/home/UI/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  final int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // عرض الصفحة الحالية

      bottomNavigationBar: PersistentTabView(
        context,
        screens: _pages,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.redAccent,
            // لون عند التحديد
            inactiveColorPrimary: Colors.grey,
            // لون عند عدم التحديد
            iconSize: 30,
            // حجم الأيقونة
            textStyle: TextStyle(fontSize: 20),
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.search),
            title: "Search",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
            iconSize: 30,
            textStyle: TextStyle(fontSize: 20),
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.settings),
            title: "Settings",
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.grey,
            iconSize: 30,
            textStyle: TextStyle(fontSize: 20),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
