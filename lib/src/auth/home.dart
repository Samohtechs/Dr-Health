//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}
class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LOGIN()),);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.only(
              left: 12, top: 5, bottom: 5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // Container(width: 15),
                Icon(Icons.logout,size: 17,),
                SizedBox(width: 10),
                const Text("Logout", style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,fontWeight: FontWeight.bold
                )),
              ]),
        ),
      ),
    );
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}