import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final _formKey = GlobalKey<FormState>();
  String age = '';
  String job = '';
  String gender = 'M';
  Map<String, double> predictedCategories = {};

  final Map<int, String> jobOptions = {
    0: "Other or not specified",
    1: "Academic/Educator",
    2: "Artist",
    3: "Clerical/Admin",
    4: "College/Grad Student",
    5: "Customer Service",
    6: "Doctor/Health Care",
    7: "Executive/Managerial",
    8: "Farmer",
    9: "Homemaker",
    10: "K-12 Student",
    11: "Lawyer",
    12: "Programmer",
    13: "Retired",
    14: "Sales/Marketing",
    15: "Scientist",
    16: "Self-employed",
    17: "Technician/Engineer",
    18: "Tradesman/Craftsman",
    19: "Unemployed",
    20: "Writer",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Category Prediction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      age =
                          value; // Store job as string or integer based on your needs
                    }),
                  ),
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: 'Job'),
                    value: 0, // Default to "Other or not specified"
                    items: jobOptions.entries.map((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.key,
                        child: Text(entry.value),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        job = newValue
                            .toString(); // Store job as string or integer based on your needs
                      });
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: gender,
                    decoration: InputDecoration(labelText: 'Gender'),
                    items: ['M', 'F', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getPrediction,
                    child: Text("Get Recommendations"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (predictedCategories.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommended Categories:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (var category in predictedCategories.entries)
                    ListTile(
                      title: Text(category.key), // The category name
                      leading: Icon(Icons.movie),
                      trailing: Text(category.value
                          .toString()), // The category description or rating
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void getPrediction() async {
    final response = await http.post(
      Uri.parse('https://iszzy.pythonanywhere.com/predict'),
      // Replace with your API URL
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "Gender": [gender],
        "Age": [age],
        "NumRatings": [3],
        "Occupation": [job]
      }),
    );
    print(age);
    print(job);

    if (response.statusCode == 200) {
      Map<String, dynamic> prediction = json.decode(response.body);
      print(prediction);
      setState(() {
        predictedCategories = Map<String, double>.from(prediction);
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
