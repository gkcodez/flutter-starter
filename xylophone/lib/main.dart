import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playAudio(int noteNumber) {
    final audioPlayer = AudioCache();
    audioPlayer.play('note$noteNumber.wav');
  }

  Expanded buildKey({Color buttonColor, int noteNumber}) {
    return Expanded(
      child: Container(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            playAudio(noteNumber);
          },
          child: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(buttonColor: Colors.red, noteNumber: 1),
            buildKey(buttonColor: Colors.blue, noteNumber: 2),
            buildKey(buttonColor: Colors.yellow, noteNumber: 3),
            buildKey(buttonColor: Colors.green, noteNumber: 4),
            buildKey(buttonColor: Colors.pink, noteNumber: 5),
            buildKey(buttonColor: Colors.teal, noteNumber: 6),
            buildKey(buttonColor: Colors.cyan, noteNumber: 7),
          ],
        ),
      ),
    );
  }
}
