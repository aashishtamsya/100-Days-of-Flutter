import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _radioValue = -1;
  String _planet = "";
  double _weight = 0.0;

  final TextEditingController _weightControler = TextEditingController();

  Image imageOfPlanet(int value) {
    var image = Image.asset(
      'images/planet.png',
      width: 100,
      height: 100,
    );
    switch (value) {
      case 0:
        image = Image.asset(
          'images/pluto.png',
          width: 100,
          height: 100,
        );
        break;
      case 1:
        image = Image.asset(
          'images/mars.png',
          width: 100,
          height: 100,
        );
        break;
      case 2:
        image = Image.asset(
          'images/venus.png',
          width: 100,
          height: 100,
        );
        break;
      default:
        image =  Image.asset(
          'images/planet.png',
          width: 100,
          height: 100,
        );
        break;
    }
    return image;
  }

  double _calculateWeight(String mass, double multipler) {
    if (int.parse(mass).toString().isNotEmpty && int.parse(mass) > 0) {
      return int.parse(mass) * multipler;
    } else {
      return 0.0;
    }
  }

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _weight = _calculateWeight(_weightControler.text, 0.06);
          _planet = "Pluto";
          break;
        case 1: // mars
          _weight = _calculateWeight(_weightControler.text, 0.38);
          _planet = "Mars";
          break;
        case 2:
          _weight = _calculateWeight(_weightControler.text, 0.91);
          _planet = "Venus";
          break;
        default:
          _weight = 0;
          _planet = "";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 128),
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            imageOfPlanet(_radioValue),
            TextField(
              controller: _weightControler,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Your Weight on Earth",
                  hintText: "In pounds",
                  icon: Icon(Icons.person_outline)),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio<int>(
                  activeColor: Colors.brown,
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChanged,
                ),
                Text(
                  "Pluto",
                  style: TextStyle(color: Colors.black38),
                ),
                Radio<int>(
                  activeColor: Colors.redAccent,
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChanged,
                ),
                Text(
                  "Mars",
                  style: TextStyle(color: Colors.black38),
                ),
                Radio<int>(
                  activeColor: Colors.orangeAccent,
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChanged,
                ),
                Text(
                  "Venus",
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Center(
              child: Text(
                _planet.isEmpty
                    ? ""
                    : "Your weight on ${_planet} is ${_weight.toStringAsFixed(2)} pounds.",
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
            )
          ],
        ),
      ),
    );
  }
}
