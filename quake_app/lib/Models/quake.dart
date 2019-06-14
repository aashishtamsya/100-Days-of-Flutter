import 'package:intl/intl.dart';

class Quake {
  final String place;
  final String title;
  final String mag;
  final String time;

  Quake({this.place, this.title, this.mag, this.time});

  factory Quake.fromJSON(Map<String, dynamic> json) {
    var date = DateTime.fromMillisecondsSinceEpoch(json["properties"]["time"], isUtc: true);
    var dateString = DateFormat.yMMMMEEEEd().format(date);

    return Quake(place: json["properties"]["place"], title: json["properties"]["title"], mag: json["properties"]["mag"].toString(), time: dateString);
  }
}