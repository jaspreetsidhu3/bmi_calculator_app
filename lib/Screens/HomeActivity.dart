import 'package:bmi_calculator_app/Screens/ResultActivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// First Screen and adding all the stateful widgets
class HomeActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeActivityState();
  }
}

// Adding States
class _HomeActivityState extends State<HomeActivity> {
  // Global key for form
  var key = GlobalKey<FormState>();

  // Group id for Switch
  int grupid = 0;
  double _currentvalueheight = 0;
  double _currentvalueweight = 3;
  double _currentvalueage = 1;

  // Controller for TextFields

  Widget build(BuildContext context) {
    return (Material(
      child: Form(
        key: key,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, top: 30.0, left: 10.0),
                          child: Container(
                            color: Colors.black26,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 50.0,
                                  top: 30.0,
                                  left: 50.0,
                                  bottom: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Male",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Radio(
                                    activeColor: Colors.blueAccent,
                                    value: 0,
                                    onChanged: getCheckbox,
                                    groupValue: grupid,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, top: 30.0, left: 10.0),
                          child: Container(
                            color: Colors.black26,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 50.0,
                                  top: 30.0,
                                  left: 50.0,
                                  bottom: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Female",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Radio(
                                    activeColor: Colors.blueAccent,
                                    value: 1,
                                    onChanged: getCheckbox,
                                    groupValue: grupid,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      width: 200,
                      height: 120,
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Text(
                            "Height",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Slider(
                                value: _currentvalueheight,
                                min: 0,
                                max: 3,
                                divisions: 10,
                                label: _currentvalueheight.round().toString(),
                                onChanged: (double d) {
                                  setState(() {
                                    debugPrint(d.toString());
                                    _currentvalueheight = d;
                                  });
                                },
                              )),
                          Text(_currentvalueheight.toStringAsPrecision(2) +
                              "meters")
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: 3.0, top: 30.0, left: 3.0),
                        child: Container(
                            height: 130,
                            width: 140,
                            color: Colors.black26,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, right: 0.0, top: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Weight",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  Expanded(
                                    child: Slider(
                                      value: _currentvalueweight,
                                      min: 3,
                                      max: 100,
                                      label: _currentvalueweight
                                          .round()
                                          .toString(),
                                      divisions: 100,
                                      onChanged: (double d) {
                                        setState(() {
                                          _currentvalueweight = d;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(_currentvalueweight
                                          .toStringAsPrecision(2) +
                                      "Kg")
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 10.0, top: 30.0, left: 10.0),
                        child: Container(
                            height: 130,
                            width: 140,
                            color: Colors.black26,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, right: 1.0, top: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Age",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  Expanded(
                                      child: Slider(
                                    value: _currentvalueage,
                                    min: 1,
                                    max: 130,
                                    label: _currentvalueage.round().toString(),
                                    divisions: 130,
                                    onChanged: (double d) {
                                      setState(() {
                                        _currentvalueage = d;
                                      });
                                    },
                                  )),
                                  Text(_currentvalueage.round().toString() +
                                      "years")
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
                          height: 100,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 10,
                          ),
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text(
                              "Calculate",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            onPressed: () {
                              setState(() {
                                if (key.currentState.validate()) {
                                  computeResult();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

// Computing all the data
  void computeResult() {
    //defining

    double sum =
        (_currentvalueweight / (_currentvalueheight * _currentvalueheight));
    // Navigating the result activity screen
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultActivity(sum.toString());
    }));
  }

  // Checking state of Switches
  void getCheckbox(int value) {
    setState(() {
      grupid = value;
      switch (grupid) {
        case 0:
          debugPrint("0");
          break;
        case 1:
          debugPrint("1");
          break;
        default:
          debugPrint("default");
      }
    });
  }
}
