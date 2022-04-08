import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/hourly.dart';
import 'package:weather_app/model/weather.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HourlyWidget extends StatelessWidget {
  const HourlyWidget({
    Key? key,
    required this.data,
    required this.hourly,
  }) : super(key: key);

  final Weather? data;
  final Hourly? hourly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.weatherToday,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: ListView.builder(
                  itemCount: data!.hourly.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(
                          DateFormat('HH:mm').format(
                            data!.hourly[index].dt,
                          ),
                        ),
                        Image.network(
                          data!.hourly[index].iconUrl,
                          width: 60,
                        ),
                        Text(
                          '${data!.hourly[index].temp.toInt() - 273}°C',
                        ),
                        // Text(
                        //   data!.hourly[index].weather[0].description,
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
      ),
    );
  }
}
