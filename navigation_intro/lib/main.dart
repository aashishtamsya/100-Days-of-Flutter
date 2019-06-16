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
                final router = MaterialPageRoute(
                    builder: (BuildContext context) => Detail(name: _nameFieldController.text.toString(),));
                Navigator.push(context, router);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Text("${widget.name}", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),),
      ),
    );
  }
}
