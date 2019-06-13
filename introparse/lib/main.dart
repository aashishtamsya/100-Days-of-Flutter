import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<Post> _data = await getJSON();
  String _body = "";
  for (int i=0; i< _data.length; i++) {
    print(_data[i].title);
    _body += (_data[i].title + "\n");
  }

  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text(_body),
      ),
    ),
  ));
}

Future<List> getJSON() async {
  String url = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(url);
  final res = json.decode(response.body);
  var list = List<Post>();
  for(int i=0; i<res.length; i++) {
    list.add(Post.fromJson(res[i]));
  }
  return list;
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
        id: parsedJson["id"],
        userId: parsedJson["userId"],
        title: parsedJson["title"],
        body: parsedJson["body"]);
  }
}
