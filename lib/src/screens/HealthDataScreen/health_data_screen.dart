// @dart=2.12

import 'package:dr_health/src/components/cards/cards.dart' as card;
import 'package:dr_health/src/handlers/video_player_handler.dart';
import 'package:dr_health/src/constant.dart';
import 'package:flutter/material.dart';

class HealthData extends StatefulWidget {
  @override
  _HealhDataState createState() => _HealhDataState();
}

class _HealhDataState extends State<HealthData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Health Data"),
      ),
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Wrap(
            children: [
              Container(
                color: Colors.black12,
                width: 400.0,
                height: 2.0,
              ),
              // Health Overview Video
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text(
                  "Overview Video.",
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
                        child: MyVideoPlayer(assetFile: "assets/videos/Apple_Health_Everythings_Connected.mp4",)
                      ),
                    ),
                  ],
                ),
              ),
              // Health Category Cards
              card.HealthCatCard(),
              // END Health Category Cards
              // CORONA UPDATES
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 10.0, bottom: 5.0, left: 10.0),
                  child: ListTile(
                    title: Text(
                      'CORONA UPDATES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stay Home, Stay Safe.',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          '(Click the card to learn more)',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: Image.asset('assets/images/stay_home.gif'),
                    tileColor: Colors.amberAccent,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    )
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'CoronaUpdateScreen');
                },
              ),
              // END CORONA UPDATES
              // WHY DRINKING WATER
              // InkWell(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 12.0, right: 10.0, bottom: 5.0, left: 10.0),
              //     child: ListTile(
              //       title: Text(
              //         'DRINKING WATER',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       subtitle: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'The Benefits of Water in our daily life',
              //             style: TextStyle(
              //               fontStyle: FontStyle.italic,
              //             ),
              //           ),
              //           Text(
              //             '(Click the card to learn more)',
              //             style: TextStyle(
              //               color: Colors.blueGrey,
              //             ),
              //           ),
              //         ],
              //       ),
              //       isThreeLine: true,
              //       trailing: Image.asset('assets/images/water_guide.gif'),
              //       tileColor: Colors.lightBlueAccent,
              //       contentPadding: const EdgeInsets.symmetric(
              //         horizontal: 10.0,
              //         vertical: 10.0,
              //       )
              //     ),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, 'CoronaUpdateScreen');
              //   },
              // ),
              // END WHY DRINKING WATER
            ],
          ),
        ),
      ),
    );
  }
}
