import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/UI/home.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

//Future<List> getWeather(String city) async {
//  http.Response response = await http.get(url);
//  final res = json.decode(response.body);
//
//}
