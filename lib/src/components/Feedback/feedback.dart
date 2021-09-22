// @dart=2.12

import 'dart:convert';

import 'package:dr_health/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserFeedback extends StatefulWidget {
  @override
  _UserFeedbacktate createState() => _UserFeedbacktate();
}

class _UserFeedbacktate extends State<UserFeedback> {
  final _formFeedBackKey = GlobalKey<FormState>();
  final controllerUname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Feedback"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formFeedBackKey,
              child: Column(
                children: [
                  buildTextField(title: 'Name', controller: controllerUname, focus: true),
                  const SizedBox(height: 10.0),
                  buildTextField(title: 'Email', controller: controllerEmail),
                  const SizedBox(height: 10.0),
                  buildTextField(title: 'Subject', controller: controllerSubject),
                  const SizedBox(height: 10.0),
                  buildTextField(title: 'Message', controller: controllerMessage, maxLines: 8),
                  const SizedBox(height: 13.5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(45),
                      textStyle: TextStyle(fontSize: 18),
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send_outlined, color: kWhiteColor),
                        const SizedBox(width: 10.0),
                        Text('Send Feedback')
                      ],
                    ),
                    onPressed: () {
                      try {
                        if(controllerUname.text.isNotEmpty && controllerEmail.text.isNotEmpty && controllerSubject.text.isNotEmpty && controllerMessage.text.isNotEmpty) {
                          sendEmail(
                            name: controllerUname.text,
                            email: controllerEmail.text,
                            subject: controllerSubject.text,
                            message: controllerMessage.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 7),
                            backgroundColor: Colors.black87,
                            content: Text('Feedback Successfully Sent'),
                            action: SnackBarAction(
                              textColor: Colors.greenAccent,
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 7),
                            backgroundColor: Colors.black87,
                            content: Text('Please fill out all fields'),
                            action: SnackBarAction(
                              textColor: Colors.greenAccent,
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ));
                        }
                      }catch(Ex) {
                        print("ERROR : $Ex");
                      }
                    } 
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Launch in-built mail app
// Future launchEmail({
//   required String toEmail,
//   required String subject,
//   required String message,
// }) async {
//   final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
//   if (await canLaunch(url)) {
//     await launch(url);
//   }
// }

// send from a service provider
Future sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async { 
  final serviceId = 'service_ror7e49';
  final templateId = 'template_jft3j16';
  final userId = 'user_Ch7YRubND8W5SK1e6PNuF';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  try {
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
    print(response);
  } catch(Ex) {
    print('NO INTERNET');
  }
}

Widget buildTextField({
  required String title,
  bool focus = false,
  required TextEditingController controller,
  int maxLines = 1,
}) =>
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal
        ),
      ),
      const SizedBox(height: 8.0),
      TextFormField(
        autofocus: focus,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      )
    ],
  );