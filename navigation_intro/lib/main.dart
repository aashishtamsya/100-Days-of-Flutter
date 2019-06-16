import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Screens",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = TextEditingController();

  Future getDetails(BuildContext context) async {
    Map details = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return Detail(name: _nameFieldController.text.toString());
    }));
    if (details != null && details.containsKey("details")) {
      print(details["details"].toString());
      _nameFieldController.text = details["details"].toString();
    } else {
      print("Nothing!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: TextField(
              controller: _nameFieldController,
              decoration: InputDecoration(hintText: "Enter your name"),
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text("Go"),
              onPressed: () {
                getDetails(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class Detail extends StatefulWidget {
  final String name;

  Detail({Key key, this.name}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "${widget.name}",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: TextField(
              controller: _detailController,
              decoration: InputDecoration(hintText: "Enter Details"),
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text("Send to Detail"),
              onPressed: () {
                Navigator.pop(
                    context, {"details": _detailController.text.toString()});
              },
            ),
          )
        ],
      ),
    );
  }
}
