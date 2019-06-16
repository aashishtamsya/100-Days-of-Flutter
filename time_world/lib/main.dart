import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Time World",
          style: TextStyle(color: Colors.black38),
        ),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "London : 3:14 PM",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
        ),
      ),
    ),
  ));
}
