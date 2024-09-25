import 'package:flutter/material.dart';
import 'package:minai_hcaid/models/article.dart';
import 'package:minai_hcaid/src/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

