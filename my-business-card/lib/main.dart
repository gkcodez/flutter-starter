import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyBusinessCard());
}

class MyBusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius:  75,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              Text(
                'Gopalakrishnan',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Pacifico'),
              ),
              SizedBox(height: 5,),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  letterSpacing: 2.5,
                  fontSize: 14,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                ),
              ),
              Divider(height: 30,color: Colors.teal.shade300, thickness: 1),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 7736346646',
                    style: TextStyle(
                        color: Colors.teal
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ListTile(
                  leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                  title: Text(
                    'gopalakrishnan1505@gmail.com',
                    style: TextStyle(
                        color: Colors.teal
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}