import 'package:flutter/material.dart';
import 'package:weather_app/model/daily.dart';
import 'package:weather_app/model/weather.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.data,
    required this.daily,
  }) : super(key: key);

  final Weather? data;
  final Daily daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Image.network(data!.daily[0].iconUrl),
          Text(
            '${data!.daily[0].temp.toInt() - 273}°C',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data!.timezone,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
