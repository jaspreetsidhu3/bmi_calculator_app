/* Developed by
    Jaspreet Singh
    08/09/2020
 */

import 'package:flutter/material.dart';
import 'Screens/HomeActivity.dart';

// main function where the execution starts
void main() {
  // inflating the widgets to views
  runApp(MyMaterialApp());
}

// Building all the required stateless widgets
class MyMaterialApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      title: "BMI Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            textAlign: TextAlign.center,
          ),
        ),
        body: HomeActivity(),
      ),
    );
  }
}
