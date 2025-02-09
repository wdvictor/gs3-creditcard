import 'dart:developer';

import 'package:creditcard/module/all_cards/presentation/controllers/transactions_controller.dart';
import 'package:creditcard/module/app/core/theme/app_theme.dart';
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

  Icon _getIconForMerchant(String merchant) {
    if (merchant.toLowerCase().contains('cinema')) {
      return Icon(Icons.movie, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('farmácia')) {
      return Icon(Icons.local_pharmacy, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('loja')) {
      return Icon(Icons.shopping_cart, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('restaurante')) {
      return Icon(Icons.restaurant, color: AppTheme.mediumBlue);
    }

    if (merchant.toLowerCase().contains('livraria')) {
      return Icon(Icons.book, color: AppTheme.mediumBlue);
    }

    if (merchant.toLowerCase().contains('supermercado')) {
      return Icon(Icons.shopping_bag, color: AppTheme.mediumBlue);
    }

    return Icon(Icons.credit_card, color: AppTheme.mediumBlue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Últimos lançamentos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, transactions, _) {
                log(transactions.length.toString());
                if (_controller.error != null) {
                  return ErrorMessage(message: _controller.error.toString());
                }
                if (_controller.isLoading) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: _getIconForMerchant(transactions[index].merchant),
                      title: Text(transactions[index].merchant),
                      subtitle: Text(transactions[index].dateTime),
                      trailing: Text("R\$${transactions[index].amount.toStringAsFixed(2)}"),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
