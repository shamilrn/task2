import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _sltd_country;
  String? _sltd_state;

  final Map<String, List<String>> countryStateMap = {
    'IN': ['KA', 'KL', 'TN', 'MH'],
    'US': ['AL', 'DE', 'GA'],
    'CA': ['ON', 'QC', 'BC'],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('Select Country'),
              value: _sltd_country,
              items: countryStateMap.keys.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _sltd_country = newValue;
                  _sltd_state = null; // Reset the state when country changes
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text('Select State'),
              value: _sltd_state,
              items: _sltd_country == null
                  ? []
                  : countryStateMap[_sltd_country!]!.map((String state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _sltd_state = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}