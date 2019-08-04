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
  @override
  Widget build(BuildContext context) {
    return Container();
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
