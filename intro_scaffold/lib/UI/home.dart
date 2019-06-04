import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onPress(String text) {
      debugPrint("$text Tapped!");
    }

    void _onTap() {
      debugPrint("Button Tapped!");
    }

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: new Text(
          "Hello Bar",
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.send), onPressed: () => _onPress("Send")),
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => _onPress("Search")),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "The Blacklist",
              style: new TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            new InkWell(
              child: new Text(
                "Press Me!",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () => _onTap(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed), title: Text("Feed")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        onTap: (int i) => debugPrint("Selected Index $i"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("Floating Action Button Tapped!"),
        backgroundColor: Colors.green,
        tooltip: 'Going Up!',
        child: Icon(Icons.add),
      ),
    );
  }
}
