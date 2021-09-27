// @dart=2.12

import 'package:dr_health/src/provider/dkt_provider.dart';
import 'package:dr_health/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorSearchScreen extends StatefulWidget {
    @override
  _DoctorSearchScreenState createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('doctors_details').snapshots();

    String? doctorName;
    String? doctorPos;
    String? doctorProfile;
    String? doctorAbout;
    String? doctorPhoneNo;
    String? doctorWhatsAppNo;
    
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Doctors List"),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: users,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    
                    if(snapshot.connectionState == ConnectionState.none) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 8.0),
                            Text("No Connection and No Cached Data...", textAlign: TextAlign.center,),
                          ]
                        ),
                      ); 
                    }
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 8.0),
                            Text("Loading, please wait...", textAlign: TextAlign.center,),
                          ]
                        ),
                      ); 
                    }
                    final data = snapshot.requireData;  
                    return ListView.builder(
                      itemCount: data.size,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                        try {
                          doctorName = data.docs[index]['Fname'] + ' ' + data.docs[index]['Lname'];
                          doctorPos = data.docs[index]['Position'];
                          doctorAbout = data.docs[index]['About'];
                          doctorProfile = data.docs[index]['Profile'];
                          doctorPhoneNo = data.docs[index]['Contact'];
                          doctorWhatsAppNo = data.docs[index]['WhatsApp_Contact'];
                        } catch(Ex) {print("ERROR");}
                        return DoctorList(
                          doctorName!, doctorPos!, doctorProfile!, doctorAbout!, doctorPhoneNo!, doctorWhatsAppNo!
                        );
                      }
                    ); 
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}