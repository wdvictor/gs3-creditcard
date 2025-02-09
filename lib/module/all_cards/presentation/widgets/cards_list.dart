import 'package:creditcard/module/all_cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/all_cards/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key, required this.cards, required this.selectedIndex});
  final List<CardEntity> cards;
  final ValueNotifier<int> selectedIndex;
  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.cards.length,
        onPageChanged: (index) {
          widget.selectedIndex.value = index;
        },
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0;
              double opacity = 1.0;

              if (_pageController.position.haveDimensions) {
                double pageOffset = _pageController.page! - index;
                scale = (1 - (pageOffset.abs() * 0.2)).clamp(0.85, 1.0);
                opacity = (1 - (pageOffset.abs() * 0.4)).clamp(0.6, 1.0);
              }

              return Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: scale,
                  child: CardWidget(card: widget.cards[index]),
                ),
              );
            },
            child: CardWidget(card: widget.cards[index]),
          );
        },
      ),
    );
  }
}
