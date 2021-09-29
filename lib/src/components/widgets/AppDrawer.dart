// @dart=2.12

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dr_health/src/auth/auth.dart';
// import 'package:dr_health/src/auth/login.dart';
import 'package:dr_health/src/utils/app_shared_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String user_email = "Dr. Health";

  @override
  void initState() {
    super.initState();
    user_email = AppPreferences.getUserEmail().toString();
  }

  @override
  Widget build(BuildContext context) {
  final whSize = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              curve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor, //Colors.green,
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/doctor100.png'),
                  )),
              child: Text(""),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Websites",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: whSize * 6,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.web_rounded, size: whSize * 15, color: Theme.of(context).primaryColor,),
              title: Text(
                'Visit UHC Website',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () {
                launch('https://www.udsm.ac.tz/web/index.php/centres/uhc');
              },
            ),
            ListTile(
              leading: Icon(Icons.web_rounded, size: whSize * 15, color: Theme.of(context).primaryColor,),
              title: Text(
                'Visit UCC Website',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () {
                launch('https://www.ucc.co.tz/');
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Communicate",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: whSize * 6,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.mail, size: whSize * 15, color: Theme.of(context).primaryColor,),
              title: Text(
                'Mail UHC',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () async {
                String toEmail = 'healthcentre@udsm.ac.tz';
                String subject = 'Your Subject Here...';
                String message = 'Your Message Here...';
                final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                if(await canLaunch(url)) {
                  await launch(url);
                } else {
                  launch(url);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, size: whSize * 15, color: Theme.of(context).primaryColor,),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () async {
                String toEmail = 'healthdr.customer.care@gmail.com';
                String subject = 'Dr. Health Client Feedback';
                String message = 'Please provide your short feedback...';
                final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                if(await canLaunch(url)) {
                  await launch(url);
                } else {
                  launch(url);
                }
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: whSize * 6,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, size: whSize * 15, color: Theme.of(context).primaryColor,),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / MediaQuery.of(context).size.width * 7,
                ),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, 'SettingsScreen'); 
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: whSize * 6,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined, size: whSize * 15, color: Theme.of(context).primaryColor,),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / MediaQuery.of(context).size.width * 7,
                ),
              ),
              onTap: () {
                 _signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),); 
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}