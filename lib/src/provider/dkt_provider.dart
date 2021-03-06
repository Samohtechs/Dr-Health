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
  String doctorAvailability;
  String receptionPhoneNo;
  String receptionEmail;

  DoctorList(this.doctorName, this.doctorPos, this.doctorProfile, this.doctorAbout, this.doctorAvailability, this.receptionPhoneNo, this.receptionEmail);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 3.0,
      leading: CircleAvatar(
        backgroundColor: Colors.lightBlue[100],
        child: CircleAvatar(
          minRadius: 45,
          maxRadius: 50,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/avatar_profile.jpg'),
          foregroundImage: NetworkImage(widget.doctorProfile),
        ),
      ), //Icon(Icons.person),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(widget.doctorName),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 9.0),
        child: Text(widget.doctorPos),
      ),
      trailing: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(widget.doctorName, widget.doctorPos, widget.doctorProfile, widget.doctorAbout, widget.doctorAvailability, widget.receptionPhoneNo, widget.receptionEmail),
            ),
          );
        },
        child: Text("VIEW", style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
      ) ,
    );
  }
}






