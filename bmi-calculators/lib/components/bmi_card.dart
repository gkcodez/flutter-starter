import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onSelect;
  BMICard({@required this.cardColor, this.cardChild, this.onSelect});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
