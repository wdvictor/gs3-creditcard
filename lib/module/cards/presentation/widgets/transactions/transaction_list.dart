import 'package:creditcard/module/app/core/extensions/build_context_extensions.dart';
import 'package:creditcard/module/cards/domain/entities/transaction_entity.dart';
import 'package:creditcard/module/cards/presentation/controllers/transactions_controller.dart';
import 'package:creditcard/module/cards/presentation/widgets/transactions/transaction_day_title.dart';
import 'package:creditcard/module/cards/presentation/widgets/transactions/transaction_tile.dart';
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

  Map<String, List<TransactionEntity>> _groupTransactionsByDay(
      List<TransactionEntity> transactions) {
    Map<String, List<TransactionEntity>> grouped = {};

    for (var transaction in transactions) {
      DateTime dateTime = DateTime.parse(transaction.dateTime);

      String dateKey =
          "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}";

      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(transaction);
    }

    return grouped;
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
          SizedBox(
            height: context.screenHeight * 0.4,
            child: ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, transactions, _) {
                final groupedTransactions = _groupTransactionsByDay(
                  transactions,
                );

                if (_controller.error != null) {
                  return ErrorMessage(
                    message: _controller.error.toString(),
                  );
                }
                if (_controller.isLoading) {
                  return CircularProgressIndicator();
                }
                return ListView(
                  children: groupedTransactions.entries.map(
                    (entry) {
                      String day = entry.key;
                      List<TransactionEntity> transactionsForDay = entry.value;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TransactionDayTitle(
                            date: day,
                          ),
                          ...transactionsForDay.map(
                            (transaction) {
                              return TransactionTile(transaction: transaction);
                            },
                          ),
                        ],
                      );
                    },
                  ).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
