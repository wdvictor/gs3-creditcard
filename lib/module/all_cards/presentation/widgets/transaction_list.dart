import 'package:creditcard/module/all_cards/presentation/controllers/transactions_controller.dart';
import 'package:creditcard/module/all_cards/presentation/widgets/transaction_tile.dart';
import 'package:creditcard/module/app/widgets/error_message.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  final String cardNumber;

  const TransactionsList({super.key, required this.cardNumber});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  late TransactionsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TransactionsController([]);
    _loadTransactions();
  }

  @override
  void didUpdateWidget(TransactionsList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.cardNumber != widget.cardNumber) {
      _loadTransactions();
    }
  }

  Future<void> _loadTransactions() async {
    await _controller.getTransactions(int.parse(widget.cardNumber));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Últimos lançamentos",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _controller,
            builder: (context, transactions, _) {
              if (_controller.error != null) {
                return ErrorMessage(
                  message: _controller.error.toString(),
                );
              }
              if (_controller.isLoading) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                addAutomaticKeepAlives: false,
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionTile(
                    transaction: transactions[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
