

import 'package:flutter/material.dart';
import 'package:readwriteapp/Utils/filehelper.dart';

void main() async {
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
      appBar: AppBar(
        title: Text("Read Write App"), backgroundColor: Colors.green,),
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
            padding: EdgeInsets.all(20),
            onPressed: () {
              writeData(_enterDataField.text);
            },
            child: Column(
              children: <Widget>[
                Text("Save Data"),
                Padding(padding: EdgeInsets.all(13),),
                Text("Saved Data goes here"),
                Padding(padding: EdgeInsets.all(24),),
                FutureBuilder(future: readData(), builder: (BuildContext context, AsyncSnapshot<String> data) {
                  if (data.hasData != null) {
                    return Text(data.data, style: TextStyle(color: Colors.blue),);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
