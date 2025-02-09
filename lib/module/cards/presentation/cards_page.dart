import 'package:creditcard/module/app/core/extensions/build_context_extensions.dart';
import 'package:creditcard/module/cards/presentation/controllers/cards_controller.dart';
import 'package:creditcard/module/cards/presentation/widgets/cards/cards_list.dart';
import 'package:creditcard/module/cards/presentation/widgets/cards/no_card_found.dart';
import 'package:creditcard/module/cards/presentation/widgets/favorites/favorites.dart';
import 'package:creditcard/module/cards/presentation/widgets/transactions/transaction_list.dart';
import 'package:creditcard/module/app/widgets/error_message.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
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
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: ValueListenableBuilder(
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
              const Divider(
                endIndent: 20,
                indent: 20,
                color: Colors.white,
              ),
              Favorites(),
              SizedBox(height: 20),
              const Divider(
                endIndent: 20,
                indent: 20,
                color: Colors.black38,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _selectedCardIndex,
                  builder: (context, index, _) {
                    return TransactionsList(
                      cardNumber: cards[index].cardNumber,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
