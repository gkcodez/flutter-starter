import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculator {
  int height;
  int weight;
  double _bmi;
  BMICalculator({@required this.height, @required this.weight});
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getResultQuote() {
    if (_bmi > 25) {
      return 'You have gained a lot of weight.\nTry to be on a diet!';
    } else if (_bmi > 18) {
      return 'You are already on a perfect body shape!';
    } else {
      return 'You seem to be underweight!\nTry to eat more...';
    }
  }
}
