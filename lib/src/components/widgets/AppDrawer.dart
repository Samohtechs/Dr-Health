import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final whSize = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              curve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/doctor1.png'),
                  )),
              child: Text(""),
            ),
            ListTile(
              leading: Icon(Icons.history_outlined, size: whSize * 15,),
              title: Text(
                'My Dosage History',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, 'MedHistoryScreen');
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "University Health Centre (UHC)",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: whSize * 6,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.web_outlined, size: whSize * 15,),
              title: Text(
                'www.uhc.co.tz',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () {
                launch('https://www.udsm.ac.tz/web/index.php/centres/uhc');
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline_outlined, size: whSize * 15,),
              title: Text(
                'healthcentre@udsm.ac.tz',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () async {
                String toEmail = 'healthcentre@udsm.ac.tz';
                String subject = 'Your Subject Here...';
                String message = 'Your Message Here...';
                final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                if(await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Communicate",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: whSize * 6,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.feedback, size: whSize * 15,),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: whSize * 7,
                ),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, 'FeedBackScreen');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, size: whSize * 15,),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / MediaQuery.of(context).size.width * 7,
                ),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, 'SettingsScreen'); 
              },
            )
          ],
        ),
      ),
    );
  }
}