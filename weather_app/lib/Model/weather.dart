class Weather {
  final String name;
  final String main;
  final String desc;
  final String icon;
  final String temp;

  Weather({this.name, this.main, this.desc, this.icon, this.temp});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        name: json["name"].toString(),
        main: json["weather"][0]["main"].toString(),
        desc: json["weather"][0]["description"].toString(),
        icon: json["weather"][0]["icon"].toString(),
        temp: json["main"]["temp"].toString());
  }
}
