import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/weather_main.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily extends ChangeNotifier {
  final DateTime dt;
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime moonrise;
  final double temp;
  final List<WeatherMain> weather;
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.temp,
    required this.weather,
  });

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weather[0].icon}@2x.png';
  }

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
