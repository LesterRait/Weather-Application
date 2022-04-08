// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      temp: (json['temp'] as num).toDouble(),
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherMain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'temp': instance.temp,
      'dt': instance.dt.toIso8601String(),
      'weather': instance.weather,
    };
