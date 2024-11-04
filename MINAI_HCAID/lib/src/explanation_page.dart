import 'package:flutter/material.dart';

class ExplanationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "How does this work?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
            ),
          ),
          SizedBox(height: 10),
          Divider(color: Colors.grey),
          SizedBox(height: 10),
          Text(
            "Our application makes predictions based on historical data of movie preferences "
                "based on age, gender, and occupation. Using a machine learning model, we analyze "
                "the input data you provide to suggest movie genres that might suit your taste.",
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            "This recommendation is made possible through data-driven insights that reflect common "
                "preferences in movie genres based on different demographics. However, these predictions "
                "are based on patterns and are not perfect indicators of individual tastes.",
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 30),
          Center(
            child: Icon(Icons.movie, size: 80, color: Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }
}
