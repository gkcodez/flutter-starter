import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AskGenie();
  }
}

class AskGenie extends StatefulWidget {
  const AskGenie({Key key}) : super(key: key);

  @override
  _AskGenieState createState() => _AskGenieState();
}

class _AskGenieState extends State<AskGenie> {
  final icons = [Icons.thumb_up, Icons.thumb_down, Icons.warning];
  final text = ['Yes', 'No', 'May Be'];
  final color = [Colors.green, Colors.red, Colors.amber];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ask Genie')),
        body: Center(
          child: TextButton(
            onPressed: () => {
              setState(
                () => {index = Random().nextInt(3)},
              ),
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  icons[index],
                  size: 150,
                  color: color[index],
                ),
                Text(
                  text[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 45,
                    color: color[index],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
