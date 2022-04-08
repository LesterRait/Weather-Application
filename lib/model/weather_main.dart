import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMain extends ChangeNotifier {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherMain({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);
}
