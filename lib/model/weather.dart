import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/daily.dart';
import 'package:weather_app/model/hourly.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather with ChangeNotifier {
  final String timezone;
  final List<Hourly> hourly;
  final List<Daily> daily;

  Weather({
    required this.timezone,
    required this.hourly,
    required this.daily,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

// class Weather with ChangeNotifier {
//   final String name;
//   final int temp;
//   final String iconCode;
//   final String description;
//   final DateTime time;

//   Weather({
//     required this.name,
//     required this.temp,
//     required this.iconCode,
//     required this.description,
//     required this.time,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       name: json['timezone'],
//       temp: double.parse(json['hourly'][0]['temp'].toString()).toInt(),
//       iconCode: json['hourly'][0]['weather'][0]['icon'],
//       description: json['hourly'][0]['weather'][0]['main'],
//       time: DateTime.fromMillisecondsSinceEpoch(
//         json['hourly'][0]['dt'],
//       ),
//     );
//   }
// }