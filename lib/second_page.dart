import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final Map<String, String> datas;

  const SecondPage({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Coucou"),
            for(var dataKey in datas.keys) Text("Data[$dataKey]: ${datas[dataKey]}")
          ],
        ),
      ),
    );
  }
}
