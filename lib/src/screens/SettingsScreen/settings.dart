// @dart=2.12

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dr_health/src/constant.dart';
import 'package:dr_health/src/handlers/datasource_handler.dart';
import 'package:dr_health/src/utils/med_preference.dart';
import 'package:flutter/material.dart';
import 'package:system_settings/system_settings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  String? _defaultSound;
  bool isSoundNotDefault = false;
  
  @override
  void initState() {
    super.initState();
    _defaultSound = MedicinePreferences.getAlarmRingtone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings_applications),
                title: Text(
                  "Notifications Settings",
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
                          items: <String>['long\ cold\ sting', 'simplesound']
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
                            fontWeight: FontWeight.w600,
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 0.9),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Licence",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: ListView.builder(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: DataSource.licenceAndTerms.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    leading: Icon(Icons.read_more),
                    title: Text(
                      DataSource.licenceAndTerms[index]['Title'],
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(DataSource.licenceAndTerms[index]['Body']),
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 0.9),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 0.9),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    leading: Icon(Icons.menu_book_outlined),
                    title: Text(
                      "Dr. Health",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                        "Version 1.0.0",
                        style: TextStyle(
                          fontSize: 13.5,
                        ),
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
}
