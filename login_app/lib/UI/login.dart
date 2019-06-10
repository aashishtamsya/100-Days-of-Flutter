import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      String username = _userController.text;
      String password = _passwordController.text;
      if (username.isNotEmpty && password.isNotEmpty) {
        _welcomeString = username;
      } else {
        _welcomeString = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 128),
        child: ListView(
          children: <Widget>[
            Center(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/tesla.png',
                      width: 90,
                      height: 90,
                    ),
                    Text(
                      _welcomeString.isEmpty
                          ? "Tesla"
                          : "Welcome, $_welcomeString",
                      style: TextStyle(fontSize: 34),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                    ),
                  ),
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: "hello_peep",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "********",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                Container(
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        color: Colors.transparent,
                        child: Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: _showWelcome,
                      ),
                      width: 320,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [
                                0.1,
                                0.5,
                                0.7,
                                0.9
                              ],
                              colors: [
                                Colors.green[800],
                                Colors.green[700],
                                Colors.green[600],
                                Colors.green[400],
                              ])),
                    ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                      color: Colors.transparent,
                      child: Text(
                        "CLEAR",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: _erase,
                    ),
                    width: 320,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [
                              0.1,
                              0.5,
                              0.7,
                              0.9
                            ],
                            colors: [
                              Colors.red[800],
                              Colors.red[700],
                              Colors.red[600],
                              Colors.red[400],
                            ])),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );

//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Center(
//        child: Container(
//          margin: EdgeInsets.only(top: 128.0),
//          alignment: Alignment.center,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Expanded(
//                child: Container(
//                  child: Column(
//                    children: <Widget>[
//                      Center(
//                        child: Image.asset(
//                          'images/tesla.png',
//                          width: 90.0,
//                          height: 90.0,
//                        ),
//                      ),
//                      Text(
//                        _welcomeString.isEmpty ? "Tesla" : "Welcome, $_welcomeString",
//                        style: TextStyle(fontSize: 34),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.all(16),
//                height: 212.0,
//                width: 320.0,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Container(
//                      alignment: Alignment.centerLeft,
//                      child: Text(
//                        "Username",
//                        style: TextStyle(fontSize: 18, color: Colors.grey[500]),
//                      ),
//                    ),
//                    TextField(
//                      controller: _userController,
//                      decoration: InputDecoration(
//                        hintText: "hello_peep",
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.only(top: 32.0),
//                      alignment: Alignment.centerLeft,
//                      child: Text(
//                        "Password",
//                        style: TextStyle(fontSize: 18, color: Colors.grey[500]),
//                      ),
//                    ),
//                    TextField(
//                      controller: _passwordController,
//                      decoration: InputDecoration(
//                        hintText: "********",
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Expanded(
//                child: Center(
//                    child: Column(
//                  children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.all(20),
//                      child: FlatButton(
//                        color: Colors.transparent,
//                        child: Text(
//                          "LOGIN",
//                          style: TextStyle(fontSize: 20, color: Colors.white),
//                        ),
//                        onPressed: _showWelcome,
//                      ),
//                      width: 320,
//                      height: 40,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(24),
//                          gradient: LinearGradient(
//                              begin: Alignment.centerLeft,
//                              end: Alignment.centerRight,
//                              stops: [
//                                0.1,
//                                0.5,
//                                0.7,
//                                0.9
//                              ],
//                              colors: [
//                                Colors.red[800],
//                                Colors.red[700],
//                                Colors.red[600],
//                                Colors.red[400],
//                              ])),
//                    ),
//                    Container(
//                      child: FlatButton(
//                        color: Colors.transparent,
//                        child: Text(
//                          "CLEAR",
//                          style: TextStyle(fontSize: 20, color: Colors.white),
//                        ),
//                        onPressed: _erase,
//                      ),
//                      width: 320,
//                      height: 40,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(24),
//                          gradient: LinearGradient(
//                              begin: Alignment.centerLeft,
//                              end: Alignment.centerRight,
//                              stops: [
//                                0.1,
//                                0.5,
//                                0.7,
//                                0.9
//                              ],
//                              colors: [
//                                Colors.red[800],
//                                Colors.red[700],
//                                Colors.red[600],
//                                Colors.red[400],
//                              ])),
//                    )
//                  ],
//                )),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
  }
}
