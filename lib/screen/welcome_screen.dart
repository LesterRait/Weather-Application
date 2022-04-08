import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String name = '';
  void button() {
    setState(() {
      name = controller.text;
    });
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              AppLocalizations.of(context)!.selectCity,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.search,
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              elevation: 10.0,
              child: Text(
                AppLocalizations.of(context)!.select,
              ),
              onPressed: () {
                button();
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                welcome: name,
                                city: name,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          controller.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
