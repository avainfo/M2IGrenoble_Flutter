import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m2igrenobleflutter/components/RedComponent.dart';
import 'package:m2igrenobleflutter/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var fields = ["First Name", "Last Name", "Email", "Password"];
  int age = 0;
  Map<String, String> map = {};

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageHeight = 280.0 * size.width / 860.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/img.png"),
                height: imageHeight,
              ),
              Container(
                height: size.height -
                    imageHeight -
                    MediaQuery.of(context).padding.top,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    SizedBox(
                      height: size.height / 20,
                      width: size.width,
                      child: const Text(
                        "Registration",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    for (String field in fields)
                      RedComponent(hintText: field, map: map),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width / 6,
                          height: size.height / 20,
                          child: const Text(
                            "Age :",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0x80000000),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(

                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width / 8,
                                height: size.height / 25,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: size.width / 6,
                                height: size.height / 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 3,
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Text(
                                    "$age",
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width / 8,
                                height: size.height / 25,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height / 25,
                            child: Checkbox(
                              checkColor: Colors.white,
                              value: checkedValue,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkedValue = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 20),
                                  children: [
                                    TextSpan(
                                        text: "Agree with ",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )),
                                    TextSpan(
                                      text: "Terms & Conditions",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 18,
                      child: CupertinoButton.filled(
                        child: const Text("Test"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(datas: map),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
