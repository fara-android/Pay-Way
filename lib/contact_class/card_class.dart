import 'package:flutter/cupertino.dart';

class CardClass{
  final String name;
  final String number;
  final String date;
  final String cvc;
  final IconData icon;

  CardClass({
    required this.name,
    required this.number,
    required this.date,
    required this.icon,
    required this.cvc,
  });
}