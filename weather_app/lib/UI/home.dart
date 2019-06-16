import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/Weather.dart';
import 'package:weather_app/Util/util.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  var _cityname = DEFAULT_CITY;

  void showWeather() async {
    Weather data = await getWeather(_cityname);
    print(data.name);
    print(data.main);
    print(data.icon);
    print(data.desc);
    print(data.temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showWeather();
            },
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 14, 16, 8),
            alignment: Alignment.topRight,
            child: updateLocationWidget(_cityname),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(64),
                  ),
                  Image.asset(
                    "images/cloud.png",
                    width: 96,
                    height: 96,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                  ),
                  updateTemperatureWidget(_cityname),
                  Padding(
                    padding: EdgeInsets.all(12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Weather> getWeather(String city) async {
    final String url =
        "http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric";
    http.Response response = await http.get(url);
    final parse = json.decode(response.body);
    return Weather.fromJson(parse);
  }

  Widget updateLocationWidget(String) {
    return new FutureBuilder(
      future: getWeather(_cityname),
      builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
        if (snapshot.hasData) {
          Weather weather = snapshot.data;
          return Text(
            weather.name,
            style: cityStyle(),
          );
        } else {
          return Text("");
        }
      },
    );
  }

  Widget updateTemperatureWidget(String) {
    return new FutureBuilder(
      future: getWeather(_cityname),
      builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
        if (snapshot.hasData) {
          Weather weather = snapshot.data;
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "${weather.temp}º C",
                    style: tempeartureStyle(),
                  ),
                  subtitle: Text("${weather.desc}"),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

TextStyle cityStyle() {
  return TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black38);
}

TextStyle tempeartureStyle() {
  return TextStyle(
      fontSize: 34, fontWeight: FontWeight.w300, color: Colors.blueAccent);
}
