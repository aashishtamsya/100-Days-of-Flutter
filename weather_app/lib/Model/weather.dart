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

String asset(String icon) {
  switch (icon) {
    case "01d":
    case "01n":
      return "clearsky";
    case "02d":
    case "02n":
      return "fewclouds";
    case "03d":
    case "03n":
      return "scatteredclouds";
    case "04d":
    case "04n":
      return "cloudy";
    case "09d":
    case "09n":
      return "showerrain";
    case "10d":
    case "10n":
      return "rain";
    case "11d":
    case "11n":
      return "thunderstorm";
    case "50d":
    case "50n":
      return "wind";
    default:
      return "cloudy";
  }
}
