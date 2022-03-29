import 'package:wallet_ui/contact_class/card_class.dart';
import 'package:flutter/material.dart';

List cardsList = <CardClass>[
  CardClass(
    name: 'Оптима основная',
    number: '4169 6548 5123 0089',
    date: '10/25',
    cvc: '888',
    icon: Icons.credit_card
  ),

  CardClass(
      name: 'Демир',
      number: '4165 4169 6548 0001',
      date: '10/25',
      cvc: '555',
      icon: Icons.credit_card
  ),

  CardClass(
      name: 'KICB кредитка',
      number: '4165 5123 0089 0001',
      date: '10/25',
      cvc: '333',
      icon: Icons.credit_card
  )
];