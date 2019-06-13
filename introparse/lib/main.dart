import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<Post> _data = await getJSON();

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("JSON Parsing - Posts"), backgroundColor: Colors.pinkAccent,),
      body: Center(
        child: ListView.builder(
            itemCount: _data.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return Divider();
              return ListTile(
                  title: Text(
                _data[position].title,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ));
            }),
      ),
    ),
  ));
}

Future<List> getJSON() async {
  String url = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(url);
  final res = json.decode(response.body);
  var list = List<Post>();
  for (int i = 0; i < res.length; i++) {
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
