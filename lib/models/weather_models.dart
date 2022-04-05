import 'package:flutter/cupertino.dart';

class Weather {
  double? latitude;
  double? longitude;
  double? temperature;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  String? name;

  Weather(
      {required this.latitude,
      this.longitude,
      this.temperature,
      this.wind,
      this.humidity,
      this.feels_like,
      this.name,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    latitude = json["coord"]["lat"];
    longitude = json["coord"]["lon"];
    temperature = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    name = json["name"];
    pressure = json["main"]["pressure"];
  }
}
