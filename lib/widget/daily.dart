import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/daily.dart';
import 'package:weather_app/model/weather.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DailyWidget extends StatelessWidget {
  const DailyWidget({
    Key? key,
    required this.data,
    required this.daily,
  }) : super(key: key);

  final Weather? data;
  final Daily daily;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.weekWeather,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: ListView.builder(
                itemCount: data!.daily.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        DateFormat('EEEE').format(
                          data!.daily[index].dt,
                        ),
                      ),
                      Image.network(
                        data!.daily[index].iconUrl,
                        width: 80,
                      ),
                      Text(
                        '${data!.daily[index].temp.toInt() - 273}°C',
                      ),
                      // Text(
                      //   data!.daily[index].weather[0].description,
                      // ),
                      const SizedBox(width: 50),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
