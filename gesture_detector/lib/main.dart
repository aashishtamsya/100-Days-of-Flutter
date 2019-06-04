
import 'package:flutter/material.dart';
import 'package:gesture_detector/UI/home.dart';

void main() {
  var title = "Gestures";

  runApp(
    MaterialApp(
      title: title,
      home: Home(title: title,),
    )
  );
}