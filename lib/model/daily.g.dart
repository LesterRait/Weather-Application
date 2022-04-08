// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
      moonrise: DateTime.fromMillisecondsSinceEpoch(json['moonrise'] * 1000),
      temp: (json['temp']['day'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherMain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt.toIso8601String(),
      'sunrise': instance.sunrise.toIso8601String(),
      'sunset': instance.sunset.toIso8601String(),
      'moonrise': instance.moonrise.toIso8601String(),
      'temp': instance.temp,
      'weather': instance.weather,
    };
