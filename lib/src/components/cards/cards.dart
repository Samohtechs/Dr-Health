// @dart=2.12

import 'package:dr_health/src/screens/HealthDataScreen/Activity/activity_screen.dart';
import 'package:dr_health/src/screens/HealthDataScreen/Mindfulness/mindfulness_screen.dart';
import 'package:dr_health/src/screens/HealthDataScreen/Nutrition/nutrition_screen.dart';
import 'package:dr_health/src/screens/HealthDataScreen/sleep/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Health Category Card
class HealthCatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          InkWell(
            child: HealthCatCardStyle(
              title: 'Activity',
              panelColor: Colors.red,
              textColor: Colors.white,
              imageBanner: "assets/images/sleep_banner.png",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityScreen()),
              );    
            },
          ),
          InkWell(
            child: HealthCatCardStyle(
              title: 'Mindfulness',
              panelColor: Colors.green,
              textColor: Colors.white,
              imageBanner: "assets/images/sleep_banner.png",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MindfulnessScreen()),
              ); 
            },
          ),
          InkWell(
            child: HealthCatCardStyle(
              title: 'Nutrition',
              panelColor: Colors.blue,
              textColor: Colors.white,
              imageBanner: "assets/images/sleep_banner.png",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NutritionScreen()),
              ); 
            },
          ),
          InkWell(
            child: HealthCatCardStyle(
              title: 'Sleep',
              panelColor: Colors.black45,
              textColor: Colors.white,
              imageBanner: "assets/images/sleep_banner.png",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SleepScreen()),
              ); 
            },
          ),
        ],
      ),
    );
  }
}
// Style for the Health Category Card
class HealthCatCardStyle extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String imageBanner;

  const HealthCatCardStyle(
      {Key? key, required this.panelColor, required this.textColor, required this.title, required this.imageBanner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                imageBanner,
              ),
            ),
          )
        ],
      ),
    );
  }
}


// Articles Card
class ArticlesCard extends StatelessWidget {
  final subtitle;
  final urlink;

  ArticlesCard(this.subtitle, this.urlink);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding:
          const EdgeInsets.only(left: 12.0, top: 5.0, bottom: 5.0, right: 12.0),
      child: InkWell(
        child: Card(
          shadowColor: Colors.grey,
          elevation: 5.0,
          color: Colors.blueAccent,
          child: ListTile(
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: Text(
                subtitle,
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
              ),
            ),
            trailing: InkWell(
              onTap: () => _launchURL(urlink),
              child: Icon(Icons.read_more_rounded, size: 60.0, color: Colors.white),
            ),
          ),
        ),
        onTap: () => _launchURL(urlink),
      ),
    );
  }
}

// URL LAUNCHER
_launchURL(urlink) async {
    if (await canLaunch(urlink)) {
      await launch(urlink, forceWebView: true);
    } else {
      throw 'Could not launch $urlink';
    }
}

// ignore: must_be_immutable
class MedShape extends StatelessWidget {
  String shapeName;
  Color? shapeColor;
  MedShape(this.shapeName, {this.shapeColor});

  // String shapeName = this.shapeName;
  @override
  Widget build(BuildContext context) {
    return Image.asset(this.shapeName, color: this.shapeColor, height: 60.0, width: 60.0, scale: 1.0,);
  }
}

// CORONA STYLE PAGE
class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red,
            textColor: Colors.white,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.lightBlue,
            textColor: Colors.white,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.lightGreen,
            textColor: Colors.white,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey,
            textColor: Colors.white,
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}
// CORONA CARD STYLE
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key? key, required this.panelColor, required this.textColor, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
