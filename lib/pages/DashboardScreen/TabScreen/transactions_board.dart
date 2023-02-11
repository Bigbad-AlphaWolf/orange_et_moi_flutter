import 'package:flutter/material.dart';

class TransactionsBoard extends StatefulWidget {
  const TransactionsBoard({super.key});

  @override
  State<TransactionsBoard> createState() => _TransactionsBoardState();
}

class _TransactionsBoardState extends State<TransactionsBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Transactions"),
    );
  }
}
