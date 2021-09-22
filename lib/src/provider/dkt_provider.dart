// @dart=2.12

// ignore: must_be_immutable
import 'package:dr_health/src/screens/DetailScreen/detail_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorList extends StatefulWidget {
  String doctorName;
  String doctorPos;
  String doctorProfile;
  String doctorAbout;
  String doctorPhoneNo;
  String? doctorWhatsAppNo;

  DoctorList(this.doctorName, this.doctorPos, this.doctorProfile, this.doctorAbout, this.doctorPhoneNo, [this.doctorWhatsAppNo]);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 3.0,
      leading: Icon(Icons.person),
      title: Text(widget.doctorName),
      subtitle: Text(widget.doctorPos),
      trailing: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(widget.doctorName, widget.doctorPos, widget.doctorProfile, widget.doctorAbout, widget.doctorPhoneNo, widget.doctorWhatsAppNo),
            ),
          );
        },
        child: Text("VIEW", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent),),
      ) ,
    );
  }
}





