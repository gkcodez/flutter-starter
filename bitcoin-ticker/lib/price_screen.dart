import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList.first;
  String crypto = cryptoList.first;
  Map<String, String> rateMap = Map<String, String>();

  @override
  void initState() {
    super.initState();
    setState(() {
      getRates();
    });
  }

  void getRates() async {
    CoinData _coinData = CoinData();
    for (var item in cryptoList) {
      rateMap[item] = await _coinData.getRate(item, selectedCurrency);
      print(rateMap[item]);
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> currencyList =
        List<DropdownMenuItem<String>>();
    for (String item in currenciesList) {
      currencyList.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
    return currencyList;
  }

  List<Widget> getPickerItems() {
    List<Widget> currencyList = List<Widget>();
    for (String item in currenciesList) {
      currencyList.add(
        Center(
          child: Text(
            item,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    return currencyList;
  }

  List<CurrencyButton> getcurrencyButtons() {
    List<CurrencyButton> currencyButtonList = List<CurrencyButton>();
    for (var item in cryptoList) {
      currencyButtonList.add(CurrencyButton(
          crypto: item,
          rate: rateMap[item],
          selectedCurrency: selectedCurrency));
    }
    return currencyButtonList;
  }

  Widget iosPicker() {
    return CupertinoPicker(
      itemExtent: 40.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getRates();
        });
      },
      children: getPickerItems(),
    );
  }

  DropdownButton<String> androidPicker() {
    return DropdownButton(
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getRates();
        });
      },
      items: getDropdownItems(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: getcurrencyButtons(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidPicker(),
          )
        ],
      ),
    );
  }
}

class CurrencyButton extends StatelessWidget {
  const CurrencyButton({
    Key key,
    @required this.crypto,
    @required this.rate,
    @required this.selectedCurrency,
  }) : super(key: key);

  final String crypto;
  final String rate;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
