import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Genie());

class Genie extends StatefulWidget {
  @override
  _GenieState createState() => _GenieState();
}

class _GenieState extends State<Genie> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            'Genie',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/ball$ballNumber.png'),
                  onPressed: () {
                    setState(() {
                      ballNumber = Random().nextInt(5) + 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
