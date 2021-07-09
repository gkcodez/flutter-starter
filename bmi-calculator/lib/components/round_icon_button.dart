import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints(minWidth: 50, minHeight: 50),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
