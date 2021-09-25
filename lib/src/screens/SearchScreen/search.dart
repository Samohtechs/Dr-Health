// @dart=2.12

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_health/src/handlers/firebase_search_controller.dart';
import 'package:dr_health/src/screens/DetailScreen/detail_screen.dart';
import 'package:dr_health/src/screens/SearchScreen/doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
    @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
  final searchController = TextEditingController();
  QuerySnapshot? snapshotData;
  bool isExecuted = false;
    Widget searchData() {
      return ListView.builder(
        itemCount: snapshotData!.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                DetailScreen(
                  snapshotData!.docs[index]['Fname'] + ' ' + snapshotData!.docs[index]['Lname'], snapshotData!.docs[index]['Profile'], snapshotData!.docs[index]['About'], snapshotData!.docs[index]['Contact'], snapshotData!.docs[index]['WhatsApp_Contact']),
                  transition: Transition.downToUp,
                  arguments: snapshotData!.docs[index]
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  snapshotData!.docs[index]['Profile']
                ),
              ),
              title: Text(
                snapshotData!.docs[index]['Fname'] + ' ' + snapshotData!.docs[index]['Lname'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
              subtitle: Text(
                snapshotData!.docs[index]['Profession'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
            ),
          );
        }
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_sweep_outlined), onPressed: () {
            setState(() {
              isExecuted = false;
            }
          );
        },
        backgroundColor: Colors.green,
        elevation: 12.0,
        splashColor: Colors.lightGreenAccent[100],
      ),
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  val.queryPosition(searchController.text).then((value) {
                    snapshotData = value;
                    setState(() {
                      isExecuted = true;
                    });
                  });
                },
              );
            }
          ),
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search by profession',
            hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          controller: searchController,
        ),
        backgroundColor: Colors.green,
      ),
      body: isExecuted ? searchData() : DoctorSearchScreen(),
    );
  }
}