import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(title: "Taskr", home: new Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _enterDataField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read Write App"), backgroundColor: Colors.green,),
      body: Container(
        padding: EdgeInsets.all(14),
        alignment: Alignment.topCenter,
        child: ListTile(
          title: TextField(
            controller: _enterDataField,
            decoration: InputDecoration(
                labelText: "Write Something"
            ),
          ),
          subtitle: FlatButton(
            onPressed: () {

            },
            child: Column(
              children: <Widget>[
                Text("Save Data"),
                Padding(padding: EdgeInsets.all(13),),
                Text("Saved Data goes here")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return new File("$path/data.txt");
  }

  Future<File> writeData(String message) async {
    final file = await localFile;
    return file.writeAsString("$message");
  }

  Future<String> readData() async {
    try {
      final file = await localFile;
      return file.readAsString();
    } catch (err) {
      return "Nothing saved yet!";
    }
  }
}
