import 'package:creditcard/module/all_cards/presentation/controllers/cards_controller.dart';
import 'package:creditcard/module/all_cards/presentation/widgets/cards_list.dart';
import 'package:creditcard/module/all_cards/presentation/widgets/no_card_found.dart';
import 'package:creditcard/module/all_cards/presentation/widgets/transaction_list.dart';
import 'package:creditcard/module/app/widgets/error_message.dart';
import 'package:flutter/material.dart';

class AllCardsPage extends StatefulWidget {
  const AllCardsPage({super.key});

  @override
  State<AllCardsPage> createState() => _AllCardsPageState();
}

class _AllCardsPageState extends State<AllCardsPage> {
  late CardsController _controller;
  final ValueNotifier<int> _selectedCardIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller = CardsController([]);
    _loadCards();
  }

  Future<void> _loadCards() async {
    await _controller.getAllCards();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, cards, _) {
          if (_controller.error != null) {
            return ErrorMessage(message: _controller.error.toString());
          }

          if (cards.isEmpty) {
            return NoCardFound();
          }
          return Column(
            children: [
              CardsList(
                cards: cards,
                selectedIndex: _selectedCardIndex,
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: _selectedCardIndex,
                  builder: (context, index, _) {
                    return TransactionsList(
                      cardNumber: cards[index].cardNumber,
                    );
                  }),
            ],
          );
        });
  }
}
