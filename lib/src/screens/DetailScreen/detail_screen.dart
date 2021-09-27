// @dart=2.12

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String _name;
  String _position;
  String _imageUrl;
  String _about;
  String _contact;
  String? _whatsappContact;
  String? iconName;

  // ignore: non_constant_identifier_names
  DetailScreen(this._name, this._position, this._imageUrl, this._about, this._contact, [this._whatsappContact]);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final double coverHeight = 180;
  final double profileHeight = 125;

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
    String _message = "Hello, Dr. ${widget._name},\ni'm texting you from Dr. Health App. I'm in need with some medication advice and if necessary arrage a meeting with you.\nThank you!";

    return CircleAvatar(
      radius: 25,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        child: InkWell(
          onTap: () {
            if (iconName == "phone") {
              launch("tel://${widget._contact}");
            } else if (iconName == "sms") {
              launchSms(
                message: _message,
                number: '${widget._contact}',  
              );
            } else if (iconName == "whatsApp") {
              String phone = '${widget._whatsappContact}'.replaceAll(' ', '');
              launch("https://wa.me/$phone/?text=${Uri.parse(_message)}");
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
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 12.0),
        child: Text(
          widget._about,
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
        Text(
          widget._position,
           style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialIcon(FontAwesomeIcons.phoneAlt, "phone"),
            const SizedBox(height: 12, width: 12,),
            buildSocialIcon(FontAwesomeIcons.sms, "sms"),
            const SizedBox(height: 12, width: 12,),
            buildSocialIcon(FontAwesomeIcons.whatsapp, "whatsApp"),
            const SizedBox(height: 12,),
          ]
        ),
        const SizedBox(height: 16,),
        buildAbout(),
      ],
    );

}
