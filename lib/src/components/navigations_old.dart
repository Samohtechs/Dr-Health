// @dart=2.12

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dr_health/src/screens/HealthDataScreen/health_data_screen.dart';
import 'package:dr_health/src/screens/SearchScreen/doctors_list.dart';
import 'package:dr_health/src/screens/index.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  int _currentTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    // Screens
    final _kTabPages = <Widget>[
      DoctorSearchScreen(), // at index 0, Search
      Home(), // at index 1, Home
      HealthData(), // at index 2, Health Data
    ];
    
    // Navigations
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded, color: Colors.white),
          activeIcon: Icon(Icons.search_rounded, color: Colors.lightGreenAccent),
          label: 'Search',
          backgroundColor: Colors.green),
      const BottomNavigationBarItem(
          icon: Icon(Icons.add_alarm_rounded, color: Colors.white),
          activeIcon: Icon(Icons.add_alarm_rounded, color: Colors.lightGreenAccent),
          label: 'Reminders',
          backgroundColor: Colors.green),
      const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_rounded, color: Colors.white),
          activeIcon: Icon(Icons.dashboard_rounded, color: Colors.lightGreenAccent),
          label: 'Health Data',
          backgroundColor: Colors.green),
    ];
    
    assert(_kTabPages.length == _kBottomNavBarItems.length);

    final bottomNavBar = BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Theme.of(context).primaryColor,
      // unselectedItemColor: Colors.white,
      // selectedItemColor: Colors.lightGreenAccent,
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      // type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
