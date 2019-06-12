import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class BMI {
  static const UNDERWEIGHT = const BMI._("UNDERWEIGHT");
  static const NORMAL = const BMI._("NORMAL");
  static const OVERWEIGHT = const BMI._("OVERWEIGHT");
  static const OBSESE = const BMI._("OBSESE");

  static get values => [UNDERWEIGHT, NORMAL, OVERWEIGHT, OBSESE];

  final String value;

  const BMI._(this.value);

  static BMI current(double bmi) {
    if (bmi >= 30.0) {
      return BMI.OBSESE;
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return BMI.OVERWEIGHT;
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return BMI.NORMAL;
    } else {
      return BMI.UNDERWEIGHT;
    }
  }

  static Color color(BMI bmi) {
    switch (bmi) {
      case BMI.UNDERWEIGHT:
        return Colors.cyanAccent;
      case BMI.NORMAL:
        return Colors.green;
      case BMI.OVERWEIGHT:
        return Colors.yellow;
      case BMI.OBSESE:
        return Colors.red;
    }
  }
}

class HomeState extends State<Home> {
  int _radioValue = 0;
  double _height = 150;
  double _weight = 115;
  double _age = 75;
  String bmi = "";
  BMI _bmi = BMI.UNDERWEIGHT;
  bool active = false;

  String getBMI(double height, double weight) {
    active = true;
    double inch = height / 2.54;
    double lbs = weight * 2.205;
    var bmi = (703 * (lbs / (inch * inch)));
    _bmi = BMI.current(bmi);
    return bmi.toStringAsFixed(1);
  }

  void _handleRadioButtonTapped(int value) {
    setState(() {
      _radioValue = value;
      bmi = getBMI(_height, _weight);
    });
  }

  void _handleHeightSliderOnChanged(double value) {
    setState(() {
      _height = value;
      bmi = getBMI(_height, _weight);
    });
  }

  void _handleWeightSliderOnChanged(double value) {
    setState(() {
      _weight = value;
      bmi = getBMI(_height, _weight);
    });
  }

  void _handleAgeSliderOnChanged(double value) {
    setState(() {
      _age = value;
      bmi = getBMI(_height, _weight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 44.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Text(
              "BMI Calculator",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  activeColor: Colors.blueAccent,
                  groupValue: _radioValue,
                  value: 0,
                  onChanged: _handleRadioButtonTapped,
                ),
                Image.asset(
                  'images/male.png',
                  width: 32,
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                Radio(
                  activeColor: Colors.pinkAccent,
                  groupValue: _radioValue,
                  value: 1,
                  onChanged: _handleRadioButtonTapped,
                ),
                Image.asset(
                  'images/female.png',
                  width: 32,
                  height: 32,
                )
              ],
            )),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Height  ${_height.toStringAsFixed(0)} cm",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Slider(
                            min: 100,
                            max: 200,
                            value: _height,
                            onChanged: _handleHeightSliderOnChanged,
                            label: "Height",
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                          ),
                          Text(
                            "Weight  ${_weight.toStringAsFixed(0)} kg",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Slider(
                            min: 30,
                            max: 200,
                            value: _weight,
                            onChanged: _handleWeightSliderOnChanged,
                            label: "Weight",
                          ),
                          Padding(
                            padding: EdgeInsets.all(32.0),
                          ),
                          Text(
                            active ? bmi : "",
                            style:
                                TextStyle(fontSize: 34, color: Colors.blueGrey),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          Text(
                            active ? _bmi.value : "",
                            style:
                                TextStyle(fontSize: 16, color: BMI.color(_bmi)),
                          ),
//                          Padding(
//                            padding: EdgeInsets.all(32.0),
//                          ),
//                          RaisedButton(
//                            color: Colors.lightBlueAccent,
//                            child: Text(
//                              "Calculate",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            onPressed: () {
//                              setState(() {
//                                bmi = getBMI(_height, _weight);
//                              });
//                            },
//                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
