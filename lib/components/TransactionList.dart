import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {

          final tr = transactions[index];

          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20,
                    ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                    )),
                    child: Text(
                      'R\$ ' + tr.value.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    )),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    tr.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(DateFormat('d MMM y H:mm').format(tr.date),
                      style: TextStyle(color: Colors.black45)),
                ])
              ],
            ),
          );
        },
      ),
    );
  }
}
