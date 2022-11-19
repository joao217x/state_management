
import "package:flutter/material.dart";
import 'package:state_management/home/model/currency_model.dart';

class CurrencyCard extends StatelessWidget {
  final CurrencyModel currency;

  const CurrencyCard({Key? key, required this.currency,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}