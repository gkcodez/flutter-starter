import 'package:flutter/material.dart';

import '../constants.dart';

class FooterButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  final Color buttonColor;
  FooterButton({@required this.buttonTitle, @required this.buttonColor, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: buttonColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: kCalculateButtonHeight,
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            style: kButtonTextStyle,
          )),
    );
  }
}
