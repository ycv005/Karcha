import 'package:flutter/material.dart';
import 'package:karcha/widgets/chart.dart';
import 'package:karcha/widgets/new_transaction.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karcha',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(button: TextStyle(color: Colors.white))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startNewTransaction(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String txTitle, double txAmount, DateTime dateTime) {
    if (txAmount < 0 || txTitle == null || dateTime == null) {
      return;
    }
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: dateTime,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
    Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karcha'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_userTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
