import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kutti Kavithai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kutti Kavithai 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool showButtons = true;
  bool isLiked = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Categories',
      style: optionStyle,
    ),
    Text(
      'Index 2: Liked',
      style: optionStyle,
    ),
    Text(
      'Index 3: About',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(alignment: Alignment.bottomRight, children: [
          TextButton(
            onPressed: () => {
              setState(() {
                showButtons = !showButtons;
              }),
            },
            child: Card(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.white, BlendMode.colorBurn),
                          image:
                              NetworkImage('https://placeimg.com/640/480/any'),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Text(
                    'இருவரும் கொல்லப்பட்டார்கள்\nபணப்பெட்டிக்காக மனிதனும்..\nசவப்பெட்டிக்காக மரமும்... \nமனிதர்கள் சார்பில் \nஇரு நிமிட மௌன அஞ்சலி... \nமரங்களின் சார்பில் \nவரும் மரணம் வரை மலர் அஞ்சலி !!!\n இருவரும் கொல்லப்பட்டார்கள்\nபணப்பெட்டிக்காக மனிதனும்..\nசவப்பெட்டிக்காக மரமும்...  \n ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        height: 2),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              semanticContainer: true,
            ),
          ),
          Visibility(
            visible: showButtons,
            child: Container(
              margin: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Download Button is pressed!');
                    },
                    child: Icon(
                      Icons.file_download,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Share Button is pressed!');
                    },
                    child: Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Icon(
                      isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                      size: 30,
                      color: isLiked ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Hey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'Mental',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
