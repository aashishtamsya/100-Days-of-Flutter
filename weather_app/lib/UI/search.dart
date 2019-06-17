import 'package:flutter/material.dart';

class ChangeCity extends StatelessWidget {
  var _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change City"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: TextField(
              controller: _cityController,
              decoration: InputDecoration(hintText: "Enter city name"),
            ),
          ),
          ListTile(
            title: RaisedButton(child: Text("Go"),onPressed: () {
              Navigator.pop(context, {"cityname": _cityController.text.toString()});
            },),
          )
        ],
      ),
    );
  }
}
