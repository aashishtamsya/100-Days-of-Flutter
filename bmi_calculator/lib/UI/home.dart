import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _radioValue = 0;
  double _height = 150;
  double _weight = 115;
  double _age = 75;
  String bmi = "";

  String getBMI(double height, double weight) {
    double inch = height / 2.54;
    double lbs = weight * 2.205;
    return (703 * (lbs / (inch * inch))).toStringAsFixed(1);
  }

  void _handleRadioButtonTapped(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _handleHeightSliderOnChanged(double value) {
    setState(() {
      _height = value;
    });
  }

  void _handleWeightSliderOnChanged(double value) {
    setState(() {
      _weight = value;
    });
  }

  void _handleAgeSliderOnChanged(double value) {
    setState(() {
      _age = value;
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
                  ),
                ],
              ),
            ),
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
                            "Age  ${_age.toStringAsFixed(0)} ${_age
                                .toStringAsFixed(0) == "1" ? "year" : "years"}",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Slider(
                            min: 1,
                            max: 150,
                            value: _age,
                            onChanged: _handleAgeSliderOnChanged,
                            label: "Age",
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                          ),
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
                          Text(bmi, style: TextStyle(fontSize: 34, color: Colors
                              .blueGrey),),
                          Padding(
                            padding: EdgeInsets.all(32.0),
                          ),
                          RaisedButton(
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Calculate",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                bmi = getBMI(_height, _weight);
                              });
                            },
                          )
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
