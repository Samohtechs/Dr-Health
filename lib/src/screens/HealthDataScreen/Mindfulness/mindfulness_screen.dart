import 'package:dr_health/src/components/HealthData/mindfulness_data.dart';
import 'package:flutter/material.dart';

class MindfulnessScreen extends StatefulWidget {
  @override
  _MindfulnessScreenState createState() => _MindfulnessScreenState();
}

class _MindfulnessScreenState extends State<MindfulnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MindfulnessData(),
    );
  }
}
