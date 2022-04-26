import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Config/config.dart';
import 'package:weather_app/model/weather.dart';

class WeatherApiClient {
  final key = Config().key;

  Future<Weather> fetchHourlyWeather(
    String? lat,
    String? lon,
    String lang,
  ) async {
    var endpoint = Uri.parse(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$key&=$lang',
    );

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
