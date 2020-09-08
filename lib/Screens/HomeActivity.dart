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

  // Controller for TextFields
  TextEditingController textEditingController_height = TextEditingController();
  TextEditingController textEditingController_weight = TextEditingController();
  TextEditingController textEditingController_age = TextEditingController();

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
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextFormField(
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Can't be empty";
                                }
                              },
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              controller: textEditingController_height,
                              decoration: InputDecoration(
                                labelText: "must be in 'm'",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: 10.0, top: 30.0, left: 10.0),
                        child: Container(
                            height: 130,
                            width: 140,
                            color: Colors.black26,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Weight",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Can't be empty";
                                        }
                                      },
                                      controller: textEditingController_weight,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          labelText: "must in Kg"),
                                    ),
                                  )
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
                                  left: 10.0, right: 10.0, top: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Age",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Can't be empty";
                                        }
                                      },
                                      controller: textEditingController_age,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      textAlign: TextAlign.center,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              signed: false, decimal: true),
                                      decoration: InputDecoration(
                                          labelText: "must be in Years"),
                                    ),
                                  )
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
                            color: Colors.deepPurple,
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
    int weight = int.parse(textEditingController_weight.text);
    int height = int.parse(textEditingController_height.text);
    int age = int.parse(textEditingController_age.text);
    double sum = (weight / (height * height));
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
