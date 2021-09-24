// @dart=2.12

import 'package:dr_health/src/components/cards/cards.dart' as card;
import 'package:dr_health/src/handlers/video_player_handler.dart';
import 'package:flutter/material.dart';

class SleepData extends StatelessWidget {
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
                      "Sleep",
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
                      "Set a bedtime. Wake at the same time. Stay consistent.",
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
                            child: MyVideoPlayer(assetFile: "assets/videos/Understanding_the_Importance_of_Sleep.mp4",)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 25.0, bottom: 8.0),
                    child: Text(
                      "Sleep is one of our body’s strongest allies. It can lift your mood, improve thinking and memory, lower stress and blood pressure, and help boost your immune system.",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 25.0, bottom: 8.0),
                    child: Text(
                      "Online Articles",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  card.ArticlesCard(
                    "Recover from Days of Sleep Deprivation...",
                    "https://www.healthline.com/health-news/it-can-take-more-than-a-week-to-recover-from-days-of-sleep-deprivation",
                  ),
                  card.ArticlesCard(
                    "Why sleep is essential for health",
                    "https://www.medicalnewstoday.com/articles/325353",
                  ),
                  card.ArticlesCard(
                    "The National Sleep Foundation's Sleep Health Index",
                    "https://www.sleephealthjournal.org/article/S2352-7218(17)30102-X/fulltext",
                  ),
                  card.ArticlesCard(
                    "Why Do We Need Sleep?",
                    "https://www.sleepfoundation.org/how-sleep-works/why-do-we-need-sleep",
                  ),
                  card.ArticlesCard(
                    "Sleep and Pregnancy",
                    "https://familydoctor.org/getting-enough-sleep-pregnancy/",
                  ),
                  card.ArticlesCard(
                    "The Benefits of Getting a Full Night's Sleep ",
                    "https://www.sclhealth.org/blog/2018/09/the-benefits-of-getting-a-full-night-sleep/",
                  ),
                  card.ArticlesCard(
                    "The Importance of Sleep for Kids",
                    "https://www.hopkinsallchildrens.org/ACH-News/General-News/The-importance-of-sleep-for-kids",
                  ),
                  card.ArticlesCard(
                    "The importance of sleep during pregnancy",
                    "https://www.evybaby.com/en-eg/moms-land/articles/2015/october/the-importance-of-sleep-during-pregnancy",
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
