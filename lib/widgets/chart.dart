import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karcha/models/transaction.dart';
import 'package:karcha/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  double weekTotalSum = 0.0;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get weekTransactionDetail {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      weekTotalSum += totalSum;
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weekTransactionDetail.map((transx) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                transx['day'],
                transx['amount'],
                weekTotalSum == 0.0
                    ? 0.0
                    : (((transx['amount'] as double) / weekTotalSum))),
          );
        }).toList(),
      ),
    );
  }
}
