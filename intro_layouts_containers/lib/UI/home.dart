import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,

      child: new Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 90,
            height: 90,
            color: Colors.green,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.blue,
          ),
        ],
      ),


//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Text("Item 1", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white, fontSize: 12),),
//          new Text("Item 2", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white, fontSize: 12),),
//          const Expanded(
//            child: const Text("Item 3"),
//          )
//          new Text("Item 4", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white, fontSize: 12),),
//
//        ],
//),





//        child: new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Text("First Item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white),),
//          new Text("Second Item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.orangeAccent),),
//          new Text("Third Item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.yellow),),
//          new Container(
//            color: Colors.deepOrange.shade600,
//            alignment: Alignment.bottomLeft,
//            child: new Text("Fourth Item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white),),
//          )
//        ],
//      )




//      child: new Text(
//        "Hello, Container!",
//        textDirection: TextDirection.ltr,
//        style: new TextStyle(
//          color: Colors.white,
//          fontWeight: FontWeight.w900,
//          fontSize: 34
//        ),
//      ),
    );
  }

}