import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: CustomButton(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        showSnackBar("Hello Gesture - on Tap!", context);
      },
      onDoubleTap: () {
        showSnackBar("Hello Gesture - on Double Tap!", context);
      },
      child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(5.5)),
          child: Text("First Button")),
    );
  }

  void showSnackBar(String text, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Theme.of(context).backgroundColor,
      duration: Duration(milliseconds: 750),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
