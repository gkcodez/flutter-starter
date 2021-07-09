import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/models/result.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bmi_card.dart';
import '../components/footer_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultText, @required this.resultValue, @required this.resultQuote});
  final String resultText;
  final String resultValue;
  final String resultQuote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kHeaderTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: BMICard(
              cardColor: kInactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    resultValue,
                    style: kNumberStyle.copyWith(fontSize: 80),
                  ),
                  Text(resultQuote.toUpperCase(),
                      textAlign: TextAlign.center, style: kLabelStyle.copyWith(fontSize: 20)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FooterButton(
                buttonTitle: 'RE-CALCULATE',
                buttonColor: kMaleActiveCardColor,
                onTap: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
