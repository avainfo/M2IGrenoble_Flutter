import 'package:flutter/material.dart';

class RedComponent extends StatelessWidget {
  final String hintText;
  final Map<String, String> map;

  RedComponent({super.key, this.hintText = "", required this.map});

  final TextEditingController textController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    String id = hintText.toLowerCase().replaceAll(" ", "");
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: TextField(
          controller: textController,
          onChanged: (value) {
            map[id] = value;
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
