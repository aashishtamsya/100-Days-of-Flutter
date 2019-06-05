import 'package:flutter/material.dart';
import 'package:make_it_rain/UI/make_it_rain.dart';

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  void _rainMoney() {
    setState(() {
      _moneyCounter += 1000;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Make It Rain!"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    "Get Rich!",
                    style: TextStyle(color: Colors.grey, fontSize: 34),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "\$ $_moneyCounter",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 34,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                    child: FlatButton(
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                      child: Text(
                        "Make It Rain!",
                        style: TextStyle(fontSize: 19),
                      ),
                      onPressed: _rainMoney,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
