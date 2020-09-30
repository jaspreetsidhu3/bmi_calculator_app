/* Developed by
    Jaspreet Singh
    08/09/2020
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'Screens/HomeActivity.dart';

// main function where the execution starts
void main() {
  // inflating the widgets to views
  runApp(MyApp());
}

//Default Application Design and calling Splash Screen
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

//StateFull Splash
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

// Splash Screen with Timer to move on MyMaterial App
class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyMaterialApp())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text(
              "Bmi Calculator",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.blue, fontSize: 21),
            ),
          ),
        ));
    // TODO: implement build
  }
}

// Building all the required stateless widgets
class MyMaterialApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
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
