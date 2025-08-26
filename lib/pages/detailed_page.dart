import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget{
  final Map rates;
  const DetailedPage({super.key, required this.rates});

  @override
  Widget build(BuildContext context){
    List _currencies = rates.keys.toList();
    List _exchangeRates = rates.values.toList();
    return Scaffold(
      body: SafeArea(child: ListView.builder(
          itemCount: _currencies.length,
          itemBuilder: (_context, _index){
            String _currency = _currencies[_index].toString().toUpperCase();
            String _rate = _exchangeRates[_index].toString();
        return ListTile(
          title: Text("$_currency: $_rate"),
        );
      })),
    );
  }
}