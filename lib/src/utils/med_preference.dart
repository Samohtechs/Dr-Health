// @dart=2.12

import 'package:shared_preferences/shared_preferences.dart';

class MedicinePreferences {
  static SharedPreferences ? _preferences;

  static const _keyMedName = 'medname';
  static const _keyMedDescription = 'meddescription';
  static const _keyMedTime = 'medtime';
  static const _keyAlarmSound = 'alarmsound';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setMedName(String medName) async => await _preferences?.setString(_keyMedName, medName,);

  static String? getMedName() => _preferences?.getString(_keyMedName);

  static Future setMedDescription(String medDescription) async => await _preferences?.setString(_keyMedDescription, medDescription);

  static String? getMedDescription() => _preferences?.getString(_keyMedDescription);

  static Future setMedTime(String medTime) async => await _preferences?.setString(_keyMedTime, medTime);

  static String? getMedTime() => _preferences?.getString(_keyMedTime);

  static Future setAlarmRingtone(String alarmName) async => await _preferences?.setString(_keyAlarmSound, alarmName);

  static String? getAlarmRingtone() => _preferences?.getString(_keyAlarmSound);


}