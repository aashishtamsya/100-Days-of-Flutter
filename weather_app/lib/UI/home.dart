import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/Weather.dart';
import 'package:weather_app/Model/weather.dart' as prefix0;
import 'package:weather_app/UI/search.dart';
import 'package:weather_app/Util/util.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  var _cityname = DEFAULT_CITY;
  var _icon = "";

  void _showWeather() async {
    Weather data = await getWeather(_cityname);
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
              goToNextScreen(context);
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
                  updateTemperatureWidget(_cityname),
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
    final weather = Weather.fromJson(parse);
    print(weather.icon);
    print(prefix0.asset(weather.icon));
    return weather;
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
                  title: Image.asset(
                    "images/${prefix0.asset(weather.icon)}.png",
                    width: 96,
                    height: 96,
                  ),
                ),
                ListTile(
                  title: Text(
                    "${weather.temp}º C",
                    style: tempeartureStyle(),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "${weather.desc}",
                    textAlign: TextAlign.center,
                  ),
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

  Future goToNextScreen(
    BuildContext context,
  ) async {
    Map results = await Navigator.push(context,
        MaterialPageRoute<Map>(builder: (BuildContext context) {
      return ChangeCity();
    }));

    if (results != null && results.containsKey("cityname")) {
      _cityname = results["cityname"].toString();
      _showWeather();
    }
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
