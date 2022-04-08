import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/widget/daily.dart';
import 'package:weather_app/widget/hourly.dart';
import 'package:weather_app/widget/info.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.widget,
    required this.data,
  }) : super(key: key);

  final HomePage widget;

  final Weather? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoWidget(
            data: data,
            daily: data!.daily[0],
          ),
          HourlyWidget(
            data: data,
            hourly: data!.hourly[0],
          ),
          DailyWidget(
            data: data,
            daily: data!.daily[0],
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
