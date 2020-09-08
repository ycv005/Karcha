import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions, this._deleteTransaction);
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return transactions.length == 0
        ? Center(
            child: Text("No Transaction added yet!"),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              var tx = transactions[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        child: Text(
                          '₹ ${tx.amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTransaction(tx.id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
