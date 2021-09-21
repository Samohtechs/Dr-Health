import 'package:dr_health/src/components/HealthData/nutrition_data.dart';
import 'package:flutter/material.dart';

class NutritionScreen extends StatefulWidget {
  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NutritionData(),
    );
  }
}
