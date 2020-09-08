import 'package:flutter/material.dart';

// Result Activity
class ResultActivity extends StatelessWidget {
  //init
  String data;

  // Contructor for defining data
  ResultActivity(String data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(
        title: "BMI Calculator",
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          backgroundColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("BMI Calculator"),
          ),
          body: Datashowing(data),
        )));
  }
}
// StatefulWidgets
class Datashowing extends StatefulWidget {
  //init
  String data;

  Datashowing(String data) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return ResultActivityState(data);
  }
}
// Adding all the State for stateful widgets
class ResultActivityState extends State<Datashowing> {
  //init
  String data;
  String Category = "category";
  double cate;
  ResultActivityState(String data) {
    this.data = data;
     cate = double.parse(data);
  // Camparing data with BMI data
    if (cate < 18.5) {
      Category = "Thin";
      debugPrint("Thin ->" + cate.toString());
    } else if (cate >= 18.5 && cate <= 24.9) {
      Category = "Healthy";
      debugPrint("Healthy ->" + cate.toString());
    } else if (cate >= 25 && cate <= 29.9) {
      Category = "Overweight";
      debugPrint("Overwight ->" + cate.toString());
    } else {
      Category = "Obese";
      debugPrint("Obese ->" + cate.toString());
    }
  }

  Widget build(BuildContext context) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              cate.toStringAsPrecision(4),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              "Score",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              Category,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        )
      ],
    ));
  }
}
