import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('I Am Poor'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[900],
      ),
      backgroundColor: Colors.lightGreen,
      body: Center(
          child: Image(
          image: AssetImage('images/poor-man.png'),
          )
      ),
    ),
  ),);
}