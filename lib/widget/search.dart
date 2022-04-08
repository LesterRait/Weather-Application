import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  String? name;
  SearchWidget({Key? key, required this.name}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // String name = '';
  void button() {
    setState(() {
      widget.name = controller.text;
    });
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title: const Text('Your city'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            MaterialButton(
              elevation: 10.0,
              child: const Text('Выбрать'),
              onPressed: () {
                button();
              },
            ),
          ],
        ),
      ],
    );
  }
}
