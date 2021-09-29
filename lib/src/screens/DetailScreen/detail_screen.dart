// @dart=2.12

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String _name;
  String _position;
  String _imageUrl;
  String _about;
  String _available;
  String _contact;
  String _email;
  String? iconName;

  // ignore: non_constant_identifier_names
  DetailScreen(this._name, this._position, this._imageUrl, this._about, this._contact, this._email, this._available,);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final double coverHeight = 180;
  final double profileHeight = 125;
  
  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Basic Information"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildCoverImage() => Container(
      color: Colors.green.shade700,
      child: Image.asset(
        "assets/images/detail_illustration.png",
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
  );
    
  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage('assets/images/avatar_profile.jpg'),
    foregroundImage:  NetworkImage(widget._imageUrl),
  );

  Widget buildTop() {
  final top = coverHeight - profileHeight / 2;
  final bottom = profileHeight / 2;

  return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage()
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildSocialIcon(IconData icon, String iconName) {
    return CircleAvatar(
      radius: 25,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        child: InkWell(
          onTap: () async {
            if (iconName == "phone") {
              launch("tel://${widget._contact}");
            } else if (iconName == "email") {
                String toEmail = widget._email; //'healthdr.customer.care@gmail.com';
                String subject = 'Doctor Appointment Request';
                String message = '(Please provide your need for an appointment here and you will be notified)';
                final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                if(await canLaunch(url)) {
                  await launch(url);
                } else {
                  launch(url);
                }
            } else {
              print("AN ERROR OCCURED");
            }
          },
          child: Center(
            child: Icon(
              icon,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAbout() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Text(
          "About",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
        child: Text(
          widget._about,
          style: TextStyle(fontSize: 16.5,),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 12.0),
        child: Text(
          "Available",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
        child: Text(
          widget._available,
          style: TextStyle(fontSize: 16.5,),
        ),
      ),
    ],
  );

  Widget buildContent() => Column(
      children: [
        const SizedBox(height: 8,),
        Text(
          widget._name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3,),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Text(
            widget._position,
             style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 20,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(height: 4,),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Center(
            child: Text(
              "Communicate with Reception for an appointment.",
               style: TextStyle(
                fontSize: 15,
                color: Colors.pinkAccent.shade200,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialIcon(FontAwesomeIcons.phoneAlt, "phone"),
            const SizedBox(height: 12, width: 12,),
            buildSocialIcon(Icons.mail_outline, "email"),
            const SizedBox(height: 12,),
          ]
        ),
        const SizedBox(height: 14,),
        buildAbout(),
      ],
    );

}
