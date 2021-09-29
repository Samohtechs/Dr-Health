import 'package:dr_health/src/components/navigation.dart';
import 'package:dr_health/src/utils/app_shared_preference.dart';
import 'package:flutter/material.dart';

class LoginPageCheck extends StatefulWidget {
  @override
  State<LoginPageCheck> createState() => _LoginPageStateCheck();
}

class _LoginPageStateCheck extends State<LoginPageCheck> {
  String userlogged;

  @override
  void initState() {
    super.initState();
    userlogged = AppPreferences.getUserEmail();
  }

  Widget buildCheck(BuildContext context) {
    return Scaffold(
      body: CheckUserLogin(),
    );
  }

  CheckUserLogin() {
    if(userlogged != null) {
      Navigator.push(context , MaterialPageRoute(builder: (context) => Navigation()));
    } else {
      Navigator.push(context , MaterialPageRoute(builder: (context) => Navigation()));
    }
  }

  @override
  Widget build(BuildContext context) {
  }
}

