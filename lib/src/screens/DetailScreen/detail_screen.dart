// @dart=2.12

import 'package:dr_health/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String _name;
  String _position;
  String _imageUrl;
  String _about;
  String _contact;
  String? _whatsappContact;


  // ignore: non_constant_identifier_names
  DetailScreen(this._name, this._position, this._imageUrl, this._about, this._contact, [this._whatsappContact]);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
    @override
    Widget build(BuildContext context) {

    String _message = "Hello, Dr. ${widget._name},\ni'm texting you from Dr. Health App. I'm in need with some medication advice and if necessary arrage a meeting with you.\nThank you!";

    double cHeight = MediaQuery.of(context).size.width*0.60;

    return Scaffold(
      // backgroundColor: Colors.indigo[100],
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/detail_illustration.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            // child: SvgPicture.asset(
                            //   'assets/icons/back.svg',
                            //   height: 18,
                            // ),
                            child: IconButton(
                              color: Colors.greenAccent,
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[                
                                CircleAvatar(
                                  backgroundColor: Colors.lightBlue[100],
                                  // radius: 45,
                                  backgroundImage: AssetImage('assets/images/loading.gif'),
                                  minRadius: 45,
                                  maxRadius: 50,
                                  child: CircleAvatar(
                                    // radius: 45,
                                    minRadius: 45,
                                    maxRadius: 50,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(widget._imageUrl),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Dr. '+widget._name.replaceFirst(' ', '\n'),
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: kTitleTextColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget._position,
                                      style: TextStyle(
                                        color: kTitleTextColor.withOpacity(0.7),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: kBlueColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/phone.svg',
                                            ),
                                          ),
                                          onTap: () {
                                            launch("tel://${widget._contact}");
                                          }
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: kYellowColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/chat.svg',
                                            ),
                                          ),
                                          onTap: () {
                                            launchSms(
                                              message: _message,
                                              number: '${widget._contact}',  
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: kYellowColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/whatsapp.svg',
                                              width: 18,
                                              height: 18,
                                            ),
                                          ),
                                          onTap: () {
                                            String phone = '${widget._whatsappContact}'.replaceAll(' ', '');
                                            launch("https://wa.me/$phone/?text=${Uri.parse(_message)}");
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'About Doctor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: kTitleTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget._about,
                              style: TextStyle(
                                height: 1.6,
                                color: kTitleTextColor.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: cHeight + 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
