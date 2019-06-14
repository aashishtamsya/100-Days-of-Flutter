import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quake_app/Models/quake.dart';

final String ALL_DAY_URL =
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
final String ALL_WEEK_URL =
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson";
final String ALL_MONTH_URL =
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson";

Color getColor(String quake) {
  if (quake.isEmpty && double.parse(quake) <= 0) return Colors.white;
  final value = double.parse(quake);
  if (value >= 8.0) {
    return Colors.red;
  } else if (value < 8.0 && value >= 7.0) {
    return Colors.deepOrange;
  } else if (value < 7.0 && value >= 6.1) {
    return Colors.orangeAccent;
  } else if (value < 6.1 && value >= 5.5) {
    return Colors.yellowAccent;
  } else if (value < 5.5 && value >= 2.5) {
    return Colors.green;
  } else {
    return Colors.lightGreenAccent;
  }
}

Color getTextColor(String quake) {
  if (quake.isEmpty && double.parse(quake) <= 0) return Colors.white;
  final value = double.parse(quake);
  if (value >= 8.0) {
    return Colors.white;
  } else if (value < 8.0 && value >= 7.0) {
    return Colors.white;
  } else if (value < 7.0 && value >= 6.1) {
    return Colors.white;
  } else if (value < 6.1 && value >= 5.5) {
    return Colors.black38;
  } else if (value < 5.5 && value >= 2.5) {
    return Colors.white;
  } else {
    return Colors.black38;
  }
}

var _data = List<Quake>();
void main() async {
  _data = await getQuakes(ALL_DAY_URL);

  runApp(MaterialApp(
    home: Home(),
  ));
}

void _showAlertMessage(BuildContext context, Quake quake) {
  final content = "Location: " +
      quake.place +
      "\n\nMagnitude: " +
      quake.mag +
      "\n\nHappened On: " +
      quake.time;
  final alert = AlertDialog(
    title: Text("Earthquake"),
    content: Text(content),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(context: context, child: alert);
}

Future<List> getQuakes(String url) async {
  http.Response response = await http.get(url);
  final parse = json.decode(response.body);
  final features = parse["features"];
  var quakes = List<Quake>();
  for (int i = 0; i < features.length; i++) {
    quakes.add(Quake.fromJSON(features[i]));
  }
  return quakes;
}


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _radioValue = 0;
//  var _data = List<Quake>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Earthquakes"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: _data.length,
                    itemBuilder: (BuildContext context, int position) {
                      if (position.isOdd) return Divider();
                      int index = position ~/ 2;
                      return ListTile(
                        subtitle: Text(
                          _data[index].time,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        title: Text(_data[index].title),
                        leading: CircleAvatar(
                          backgroundColor: getColor(_data[index].mag),
                          child: Text(
                            _data[index].mag,
                            style: TextStyle(
                                color: getTextColor(_data[index].mag)),
                          ),
                        ),
                        onTap: () {
                          _showAlertMessage(context, _data[index]);
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }

}