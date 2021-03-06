// @dart=2.12

import 'package:dr_health/src/handlers/video_player_handler.dart';
import 'package:flutter/material.dart';

class NutritionData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 6.0,
        shadowColor: Colors.blueGrey,
        title: Text("Health Data"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(top: 6.0, left: 25.0, bottom: 5.0),
                    child: Text(
                      "Nutrition",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    width: 400.0,
                    height: 2.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 25.0, bottom: 8.0),
                    child: Text(
                      "Eat more real food. Eat less junk food. Watch the amount.",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 230.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: MyVideoPlayer(assetFile: "assets/videos/Apple_Health_Nutrition.mp4")
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 5.0, bottom: 8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Nutrition is the study of nutrients in food, how the body uses them, and the relationship between diet, health, and disease. Nutritionists use ideas from molecular biology, biochemistry, and genetics to understand how nutrients affect the human body.",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
