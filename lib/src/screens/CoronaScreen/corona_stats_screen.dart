// @dart=2.12

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dr_health/src/handlers/corona_datasource_handler.dart';
import 'package:dr_health/src/screens/CoronaScreen/country_screen.dart';
import 'package:dr_health/src/components/panels/info_panel.dart';
import 'package:dr_health/src/components/panels/most_affected_countries.dart';
import 'package:dr_health/src/components/cards/cards.dart';
import 'package:http/http.dart' as http;

class CoronaPage extends StatefulWidget {
  @override
  _CoronaPageState createState() => _CoronaPageState();
}

class _CoronaPageState extends State<CoronaPage> {
  Map? worldData;
  fetchWorldWideData() async {
    try {
      http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/all'));
      setState(() {
        worldData = json.decode(response.body);
      });
    } catch(Ex) {
      debugPrint("NO INTERNET : $Ex");
    }
  }
  
  List? countryData;
  fetchCountryData() async {
    try {
      http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases'));
      setState(() {
          countryData = json.decode(response.body);
      });
    } catch(Ex) {
      debugPrint("NO INTERNET : $Ex");
    }
  }

  Future fetchData() async{
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    try {
      fetchData();
      super.initState();
    } catch(Exception) {
      print('NO INTERNET : $Exception');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'COVID-19 TRACKER',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Worldwide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CountryPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            worldData == null
            ? Center(child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 3,),
                Text(
                  '(If taking too long, check your internet connection.)',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ))
            : WorldwidePanel(
                worldData: worldData!,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Most affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData!,
                  ),
            InfoPanel(),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'WE ARE TOGETHER IN THE FIGHT',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }
}
