import 'package:dr_health/src/screens/SearchScreen/doctors_list.dart';
import 'package:flutter/material.dart';

class LocalSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      title: Text("Search"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: ServiceSearch(),
            );
            // print(results);
          },
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
    ),
    body: Container (
      color: Colors.white,
      child: DoctorSearchScreen(),
    )
  );
}

class ServiceSearch extends SearchDelegate<String> {
  final services  = [
    'Eye and Optical Services',
    'Counselling and testing for HIV and provisions of antiretroviral drugs (ARV) to people living with HIV/AIDS',
    'Minor surgery',
    'Reproductive and child health services',
    'Prevention of mother to child transmission of HIV'
    'Ambulance Services',
    'Health education, communication and counselling students on adolescent reproductive health',
    'Specialized clinics in Obstetrics and Gynaecology, Paediatrics, Psychiatry and Mental Health and Medical imaging. It also offers special clinic in dermatological conditions, sexually transmitted infections and diabetes.'
  ];

  final recentServices = [
    'Eye and Optical Services',
    'Ambulance Services',
    'Counselling and testing for HIV and provisions of antiretroviral drugs (ARV) to people living with HIV/AIDS',
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if(query.isEmpty) {
          close(context, null);
        } else {
          query = '';
          showSuggestions(context);
        }
      },
    ),
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      close(context, null);
    },
  );

  @override
  Widget buildResults(BuildContext context) => Center (
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          query,
          style: TextStyle(
            color: Colors.black,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
    ? recentServices
    : services.where((service) {
      final serviceLower = service.toLowerCase();
      final queryLower = query.toLowerCase();

      return serviceLower.startsWith(queryLower);
    }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        final queryText = suggestion.substring(0, query.length);
        final remainingText = suggestion.substring(query.length);

        return ListTile (
          leading: Icon(Icons.ac_unit),
          // title: Text(suggestion),
          title: RichText(
            text: TextSpan(
              text: queryText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: remainingText,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Text('Make Appointment'),
          trailing: Icon(Icons.book),
          onTap: () {
            query = suggestion;
            close(context, suggestion);
            // showResults(context);
          },
        );
      },
  );
}