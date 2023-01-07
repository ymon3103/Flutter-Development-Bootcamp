import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'CHF',
  'EUR',
  'GBP',
  'USD',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String apiKey = '99C31186-F0D9-41DF-B9E2-97A2AB0AC0E3';

class CoinData {
  Future<double?> getCoinData(
      {required String coin, required String currency}) async {
    Uri url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=$apiKey');
    http.Response response = await http.get(url);

    double? rate;
    if (response.statusCode == 200) {
      String data = response.body;

      rate = jsonDecode(data)['rate'];
    } else {
      print(
          'ERROR ${response.statusCode} occured when fetching data from the remote API.');
    }
    return rate;
  }
}
