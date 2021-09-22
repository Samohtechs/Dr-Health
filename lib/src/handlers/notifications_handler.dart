import 'dart:typed_data';

import 'package:dr_health/src/models/pill.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {

  BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(BuildContext context) async{
    this._context = context;
    //-----------------------------| Inicialize local notifications |--------------------------------------
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    return flutterLocalNotificationsPlugin;
    //======================================================================================================
  }

  //---------------------------------| Show the notification in the specific time |-------------------------------
  Future showNotification(String title, String description, int time, int id, FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id.toInt(),
        title,
        description,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        NotificationDetails(
            android: AndroidNotificationDetails(
                'Dr Health Med Reminder', // channel id
                'Notification reminders', // channel name
                'Dr Health Mediciation Reminder', // channel route
                playSound: true,
                showWhen: true,
                autoCancel: true,
                visibility: NotificationVisibility.public,
                ongoing: true,
                enableVibration: true,
                vibrationPattern: Int64List.fromList([8]),
                enableLights: true,
                subText: "Med Reminder",
                icon: 'ic_launcher',
                largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
                sound: RawResourceAndroidNotificationSound('longcoldsting'), // '$_alarmName'
                color: Colors.cyanAccent,
                importance: Importance.high,
                priority: Priority.high,
                additionalFlags: Int32List.fromList([4]),
              )
            ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

  //================================================================================================================


  //-------------------------| Cancel the notify |---------------------------
  Future removeNotify(int notifyId, FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async{
    try{
      return await flutterLocalNotificationsPlugin.cancel(notifyId);
    }catch(e){
      return null;
    }
  }

  //==========================================================================


  //-------------| function to inicialize local notifications |---------------------------
  Future onSelectNotification(String payload) async {
    showDialog(
      context: _context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }
//======================================================================================


}