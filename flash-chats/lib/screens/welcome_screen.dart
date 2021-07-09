import 'package:flutter/material.dart';

import '../components/RoundedButton.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //   duration: Duration(seconds: 5),
    //   vsync: this,
    // );
    // animationController.forward();
    // // animation =
    // //     CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    // animation = ColorTween(begin: Colors.grey, end: Colors.yellow)
    //     .animate(animationController);
    // animationController.addListener(() {
    //   setState(() {});
    //   print(animation.value);
    // });
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 80,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    speed: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonColor: Colors.lightBlueAccent,
              buttonText: 'Login',
              onClick: () {
                //Go to registration screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              buttonColor: Colors.blueAccent,
              buttonText: 'Register',
              onClick: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
