import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMICardIcon extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  BMICardIcon({@required this.cardIcon, @required this.cardText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          cardText,
          style: kLabelStyle,
        )
      ],
    );
  }
}
