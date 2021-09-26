import 'package:dr_health/src/components/navigation.dart';
import 'package:dr_health/src/screens/CoronaScreen/corona_stats_screen.dart';
import 'package:dr_health/src/screens/MedicineScreen/add_new_medicine.dart';
import 'package:dr_health/src/screens/SettingsScreen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dr_health/src/screens/index.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  await SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black.withOpacity(0.05),
    statusBarColor: Colors.black.withOpacity(0.05),
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(MedicineApp());
}

class MedicineApp extends StatefulWidget {
  @override
  _MedicineAppState createState() => _MedicineAppState();
}

class _MedicineAppState extends State<MedicineApp> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Firebase
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Popins",
          //////////////////////////
          primaryColor: Colors.green.shade900, //Colors.green,
          /////////////////////////////// //Color.fromRGBO(7, 190, 200, 1),
          textTheme: TextTheme(
              headline1: ThemeData.light().textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 38.0,
                    fontFamily: "Popins",
                  ),
              headline5: ThemeData.light().textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                    fontFamily: "Popins",
                  ),
              headline3: ThemeData.light().textTheme.headline3.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: "Popins",
                  ))),
      routes: {
        "/": (context) => Navigation(),
        "/home": (context) => Home(),
        "/AddNewMedicine": (context) => AddNewMedicine(),
        "CoronaUpdateScreen": (context) => CoronaPage(),
        "SettingsScreen": (context) => SettingsPage(),
      },
      initialRoute: "/",
    );
  }
}
