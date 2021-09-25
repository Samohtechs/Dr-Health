// @dart=2.12

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dr_health/src/screens/HealthDataScreen/health_data_screen.dart';
import 'package:dr_health/src/screens/SearchScreen/search.dart';
import 'package:dr_health/src/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}


class _NavigationState extends State<Navigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int tabIndex = 2;

  final screens = [
    Search(), // at index 0, Search
    Home(), // at index 1, Home
    HealthData(), // at index 2, Health Data
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      Icon(Icons.search, size: 30),
      Icon(Icons.alarm_add, size: 30),
      Icon(Icons.dashboard_rounded, size: 30),
    ];

    final navigationIcons = Theme (
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: CurvedNavigationBar(
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: tabIndex,
          items: items,
          onTap: (index) => setState(() => this.tabIndex = index),
      ),
        ),
    );

    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.blue,
          body: screens[tabIndex],
          bottomNavigationBar: navigationIcons
        ),
      ),
    );
  }
}
