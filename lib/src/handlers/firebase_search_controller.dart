// @dart=2.12

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    try {
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore.collection(collection).get();
      return snapshot.docs;
    } catch(Ex) {
      return "No Query Specified";
    }
  }

  // Future queryFullName(String doctorName) async {
  //   return await FirebaseFirestore.instance
  //   .collection('doctors_details')
  //   .where('Fname . Lname',isGreaterThanOrEqualTo: doctorName)
  //   .get();
  // }

  Future queryPosition(String doctorPosition) async {
    try {
      return await FirebaseFirestore.instance
      .collection('doctors_details')
      .where('Position',isGreaterThanOrEqualTo: doctorPosition)
      .get();
    } catch(Ex) {
      return "No Query Specified";
    }
  }
}