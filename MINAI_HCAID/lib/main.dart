import 'package:flutter/material.dart';
import 'package:minai_hcaid/src/explanation_page.dart';
import 'package:minai_hcaid/src/home_page.dart';
import 'package:minai_hcaid/src/prediction_page.dart';

void main() {
  runApp(MovieRecommendationApp());
}

class MovieRecommendationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Movie Recommendation App'),
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Movie Rec"),
            Tab(text: "Predict"),
            Tab(text: "Explanation"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          PredictionPage(),
          ExplanationTab(),
        ],
      ),
    );
  }
}
