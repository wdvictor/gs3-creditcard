import 'package:creditcard/module/cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final CardEntity card;

  const CardWidget({super.key, required this.card});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isVisible = false;

  String _getCardBrand() {
    if (widget.card.cardNumber.startsWith("4")) {
      return "assets/visa.png";
    } else if (widget.card.cardNumber.startsWith("5")) {
      return "assets/mastercard.png";
    }
    return "assets/default.png";
  }

  String _getFormattedCardNumber() {
    if (_isVisible) {
      return widget.card.cardNumber
          .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
    } else {
      return "•••• •••• •••• ${widget.card.cardNumber.substring(widget.card.cardNumber.length - 4)}";
    }
  }

  Widget _getBottomInformation(String title, String value, {TextAlign? textAlign}) {
    return Text.rich(
      textAlign: textAlign ?? TextAlign.start,
      TextSpan(
        text: title,
        style: AppTheme.textTheme.bodySmall!.copyWith(color: Colors.white),
        children: [
          TextSpan(
            text: value,
            style: AppTheme.textTheme.titleSmall!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  String formatCurrency(double value) {
    List<String> parts = value.toStringAsFixed(2).split('.');
    String integerPart = parts[0];
    String decimalPart = parts[1];

    String formattedInteger = '';
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedInteger = integerPart[i] + formattedInteger;
      count++;
      if (count == 3 && i != 0) {
        formattedInteger = '.$formattedInteger';
        count = 0;
      }
    }

    return "$formattedInteger,$decimalPart";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient:
                LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
              AppTheme.lightBlue,
              AppTheme.darkBlue,
            ]),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        _getCardBrand(),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getFormattedCardNumber(),
                            style: AppTheme.textTheme.titleMedium!
                                .copyWith(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            widget.card.name,
                            style: AppTheme.textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getBottomInformation(
                      'Limite disponível\nR\$ ', formatCurrency(widget.card.availableLimit)),
                  _getBottomInformation('Melhor dia de compra\n', widget.card.bestPurchaseDate,
                      textAlign: TextAlign.end),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
