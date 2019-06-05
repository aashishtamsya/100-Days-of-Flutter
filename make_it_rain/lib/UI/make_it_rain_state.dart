import 'package:flutter/material.dart';
import 'package:make_it_rain/UI/make_it_rain.dart';

class MakeItRainState extends State<MakeItRain> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Make It Rain!"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Center(),
    );
  }
}
