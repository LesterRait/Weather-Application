import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/model/weather.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:weather_app/widget/widget.dart';
import '../services/api_client.dart';

class HomeScreen extends StatefulWidget {
  final String welcome;
  String city;
  HomeScreen({
    Key? key,
    required this.welcome,
    required this.city,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String city = 'Moscow';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            show();
          },
          icon: const Icon(Icons.search),
          color: Colors.black,
          iconSize: 30,
        ),
        title: Text(
          AppLocalizations.of(context)!.weather,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const [
          SelectLanguageWidget(),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WeatherWidget(widget: widget, data: data);
          }
          return Container();
        },
      ),
    );
  }

// ShowDialog & Controller

  final controller = TextEditingController();

  void button() {
    setState(() {
      widget.city = controller.text;
    });
  }

  void show() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.yourCity),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.city,
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            MaterialButton(
              elevation: 10.0,
              child: Text(AppLocalizations.of(context)!.select),
              onPressed: () {
                button();
              },
            ),
          ],
        );
      },
    );
  }

  // Get location
  Future<void> getData() async {
    List<Location> locations =
        await locationFromAddress(widget.city ?? widget.welcome);
    print(locations);
    data = await client.fetchHourlyWeather(
      '${locations[0].latitude}',
      '${locations[0].longitude}',
      'en',
    );
  }
}
