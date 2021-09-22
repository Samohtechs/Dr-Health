// @dart=2.12

import 'package:dr_health/src/components/feedback/feedback.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState  createState() => _FeedbackScreenState ();
}

class _FeedbackScreenState  extends State<FeedbackScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: UserFeedback()
          ),
        ),
      ),
    );
  }

}