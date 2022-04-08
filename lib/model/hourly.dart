import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/weather_main.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly extends ChangeNotifier {
  final double temp;
  final DateTime dt;
  final List<WeatherMain> weather;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weather[0].icon}@2x.png';
  }

  Hourly({
    required this.temp,
    required this.dt,
    required this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}
