// @dart=2.12

import 'package:dr_health/src/components/cards/cards.dart' as card;
import 'package:dr_health/src/handlers/video_player_handler.dart';
import 'package:flutter/material.dart';

class MindfulnessData extends StatelessWidget {
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
                      "Mindfulness",
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
                      "Quiet your mind. Relax your body. Be in the moment",
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
                            child: MyVideoPlayer(assetFile: "assets/videos/Everyday_mindfulness.mp4",)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(left: 12.0, top: 5.0, bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        "Mindfulness",
                        style:
                            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          "Mindfulness is a state of active, open attention on the present. When you're mindful, you observe your thoughts and feelings from a distance, without judging them good or bad. Instead of letting your life pass you by, mindfulness means living in the moment and awakening to experience.",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                      ),
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
                      "Benefits of Mindfulness",
                      "https://www.helpguide.org/harvard/benefits-of-mindfulness.htm"
                    ),
                    card.ArticlesCard(
                      "The Importance of Mindfulness: 20+ Reasons to Practice Mindfulness",
                      "https://positivepsychology.com/importance-of-mindfulness/"
                    ),
                    card.ArticlesCard(
                      "What is Mindfulness Therapy and How to Apply It?",
                      "https://positivepsychology.com/mindfulness-therapy/"
                    ),
                    card.ArticlesCard(
                      "Improving Sleep Through Mindfulness Meditation",
                      "https://positivepsychology.com/improving-sleep-mindfulness/"
                    ),
                    card.ArticlesCard(
                      "What Is Mindful Walking Meditation and How Can It Impact Your Life?",
                      "https://positivepsychology.com/mindful-walking/"
                    ),
                    card.ArticlesCard(
                      "65+ Mindfulness Worksheets for Adults, Kids, and Your Therapy Sessions",
                      "https://positivepsychology.com/mindfulness-worksheets/"
                    ),
                    card.ArticlesCard(
                      "Mindfulness and the Brain: What Does Research and Neuroscience Say?",
                      "https://positivepsychology.com/mindfulness-brain-research-neuroscience/"
                    ),
                    card.ArticlesCard(
                      "18 Mindfulness Games, Worksheets and Activities for Kids",
                      "https://positivepsychology.com/mindfulness-for-kids/"
                    ),
                    card.ArticlesCard(
                      "Mindfulness at Work: Using Mindful Leadership in the Workplace",
                      "https://positivepsychology.com/mindfulness-at-work/"
                    ),
                    card.ArticlesCard(
                      "What Is Mindful Breathing? Exercises, Scripts, and Videos",
                      "https://positivepsychology.com/mindful-breathing/"
                    ),
                    card.ArticlesCard(
                      "Practicing Mindfulness in Groups: 9 Activities and Exercises",
                      "https://positivepsychology.com/group-mindfulness-activities/"
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
