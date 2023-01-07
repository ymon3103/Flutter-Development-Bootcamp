import 'package:bitcointicker/coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  Map<String, int> coinValue = {};

  @override
  void initState() {
    super.initState();
    refreshCoins();
  }

  refreshCoins() async {
    for (String coin in cryptoList) {
      CoinData coinData = CoinData();
      double? nullableValue =
          await coinData.getCoinData(coin: coin, currency: selectedCurrency);
      double valueAsDouble = nullableValue ?? 0;
      int value = valueAsDouble.toInt();
      setState(() {
        coinValue[coin] = value;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = currenciesList
        .map((currency) => DropdownMenuItem(
              value: currency,
              child: Text(currency),
            ))
        .toList();

    return dropdownItems;
  }

  List<Widget> getCoinCards() {
    List<Widget> coinCards = coinValue.keys
        .map((coin) => Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 $coin = ${coinValue[coin] ?? '?'} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ))
        .toList();

    return coinCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                children: getCoinCards(),
              )),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: getDropdownItems(),
              onChanged: (String? value) {
                setState(() {
                  if (value != null) {
                    selectedCurrency = value;
                    refreshCoins();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
