import 'package:bitcoin_ticker/networking.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apiKey = 'ED938900-36CC-43E1-8F09-3DEA9E431535';
const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apiKey=$apiKey';

class CoinData {
  // String currency;
  // String crypto;
  // CoinData({this.currency, this.crypto});

  NetworkHelper _networkHelper = NetworkHelper();

  Future getRate(crypto, currency) async {
    var responseData = await _networkHelper.getData(
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apiKey=$apiKey');
    double rate = jsonDecode(responseData.body)['rate'];
    try {
      String rateString = rate.toStringAsFixed(2);
      return rateString;
    } catch (e) {
      return '0.00';
    }
  }
}
