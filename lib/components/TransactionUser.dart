import 'dart:math';

import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';

import 'TransactionForm.dart';
import 'TransactionList.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  
  final _transactions = [
    Transaction(
      't1',
      'Novo Tênis de Corrida',
      310.70,
      DateTime.now(),
    ),
    Transaction(
      't2',
      'Conta Luz',
      222.60,
      DateTime.now(),
    ),
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(
      Random().nextDouble().toString(),
      title,
      value,
      DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(addTransaction),      
      ]
    );
  }
}