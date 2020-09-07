import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmt;
  final double spendingPercentTotal;
  ChartBar(this.label, this.spendingAmt, this.spendingPercentTotal);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          Container(
              height: 17, child: FittedBox(child: Text("₹ $spendingAmt"))),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 80,
            width: 10,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: FractionallySizedBox(
              heightFactor: spendingPercentTotal,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(label),
        ],
      ),
    );
  }
}
