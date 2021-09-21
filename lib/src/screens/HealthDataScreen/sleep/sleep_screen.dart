import 'package:dr_health/src/components/HealthData/sleep_data.dart';
import 'package:flutter/material.dart';

class SleepScreen extends StatefulWidget {
  @override
  _SleepScreenState createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SleepData(),
    );
  }
}
