import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<Post> _data = await getJSON();

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "JSON Parsing - Posts",
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
          child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int position) {
                if (position.isOdd) return Divider();
                final index = position ~/ 2;
                return ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  subtitle: Text(
                    _data[index].body,
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  title: Text(_data[index].title),
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Text(
                      _data[index].id.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    _showOnTapMessage(context, _data[index].body);
                  },
                );
              })),
    ),
  ));
}

void _showOnTapMessage(BuildContext context, String message) {
  var alert = Platform.isAndroid
      ? AlertDialog(
          title: Text("App"),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      : CupertinoAlertDialog(
          title: Text("App"),
          content: Text(message),
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
