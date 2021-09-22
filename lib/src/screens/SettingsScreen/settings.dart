// @dart=2.12

import 'package:dr_health/src/constant.dart';
import 'package:dr_health/src/utils/med_preference.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:system_settings/system_settings.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _userEmailKey = GlobalKey<FormState>();

  String? _defaultSound;
  bool isSoundNotDefault = false;
  String _userEmailAddr = 'your@email.com';
  bool _isEmailSet = false;

  @override
  void initState() {
    super.initState();
    _userEmailAddr = MedicinePreferences.getUserEmail() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          "Settings"
        ),
      ),
      body: settingTiles(),
    );
  }

  settingTiles() {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 15.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "General",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings_applications),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Notification settings like sound, vibration etc.",
                  style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
                onTap: () => SystemSettings.appNotifications(),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "Application Info",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Dr. Health Application information",
                  style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
                onTap: () => SystemSettings.app(),
              ),
              ExpansionTile(
                leading: Icon(Icons.notifications),
                title: Text(
                  'Notifications',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Set Notification Sound",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                      child: ListTile(
                        leading: Icon(Icons.notifications_active),
                        title: Text(
                          "Alarm Ringtone",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        subtitle:  DropdownButton<String>(
                          value: _defaultSound,
                          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
                          items: <String>['long\ cold\ sting', 'lights', 'chill']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value.replaceAll(' ', ''),
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            MedicinePreferences.getAlarmRingtone()?.replaceAll('', ' ') ?? 'long cold sting (Default)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _defaultSound = value!.replaceAll(' ', '');
                            MedicinePreferences.setAlarmRingtone(_defaultSound!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Personal",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),
              ExpansionTile(
                leading: Icon(Icons.email_rounded),
                title: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Set Email Address",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _userEmailKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (EmailValidator.validate(_userEmailAddr)) {
                                return "Email is not valid.";
                              }
                            },
                            textCapitalization: TextCapitalization.none,
                            decoration: InputDecoration(
                              hintText: _isEmailSet ? "Email Address" : _userEmailAddr,
                              helperText: 'your@email.com',
                            ),
                            onSaved: (String? val) => setState(() => _userEmailAddr = val!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 50, bottom: 10.0, left: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent.withOpacity(0.4),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(1.8, 1.8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle, color: Colors.greenAccent, size: 20.0,),
                              SizedBox(width: 5.0),
                              Text(
                                "Save",
                                style: TextStyle(color: Colors.white, fontSize: 18.7),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                       if(_userEmailKey.currentState!.validate()) {
                          _userEmailKey.currentState!.save();
                          if(_userEmailAddr != 'your@email.com') {
                            await MedicinePreferences.setUserEmail(_userEmailAddr);
                          }
                       }
                    }
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.phone_sharp),
                title: Text(
                  "Phone",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "Set Phone Number",
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.black87,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        "Coming Soon!",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          ),
                        ),
                      content: Text(
                        "User will receive notification alert through their mobile number.",
                        style: TextStyle(
                          color: Colors.white,
                          ),
                      ),
                      backgroundColor: Colors.blueAccent,
                      actions: [
                        Container(
                          color: Colors.white70,
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "Awesome!",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  );
                },
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 0.9),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.menu_book_rounded),
                title: Text(
                  "Dr. Health",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    pkgInfo(),
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  pkgInfo() {
    String version = 'Version';
    String code = 'Build Number';
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    version = packageInfo.version;
    code = packageInfo.buildNumber;
  });
    return version + '\n' + code;
  }
}
