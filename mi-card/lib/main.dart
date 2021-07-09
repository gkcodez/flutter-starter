/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Card Demo'),
          backgroundColor: Colors.amber.shade800,
          centerTitle: true,
        ),
        backgroundColor: Colors.cyan[600],

        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 80,
                child: ClipOval(child: Image.asset('images/krishna.jpg')),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Gopalakrishnan',
                style: TextStyle(
                    color: Colors.white, fontSize: 36, fontFamily: 'Pacifico'),
                textAlign: TextAlign.center,
              ),
              Text(
                'SOFTWARE DEVELOPER',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: 'Source Sans Pro',
                    letterSpacing: 2.5),
                textAlign: TextAlign.center,
              ),
              Divider(
                indent: 100,
                endIndent: 100,
                thickness: 1,
                color: Colors.blue.shade200,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    '+91 773634666',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    'gopalakrishnan1505@gmail.com',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
