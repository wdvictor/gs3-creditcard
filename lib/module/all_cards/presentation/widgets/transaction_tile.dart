import 'package:creditcard/module/all_cards/domain/entities/transaction_entity.dart';
import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});
  final TransactionEntity transaction;

  Icon _getIconForMerchant(String merchant) {
    if (merchant.toLowerCase().contains('cinema')) {
      return Icon(Icons.movie_creation_outlined, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('eletrônicos')) {
      return Icon(Icons.computer_outlined, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('farmácia')) {
      return Icon(Icons.local_pharmacy_outlined, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('loja')) {
      return Icon(Icons.shopping_cart_outlined, color: AppTheme.mediumBlue);
    }
    if (merchant.toLowerCase().contains('restaurante')) {
      return Icon(Icons.restaurant_menu_outlined, color: AppTheme.mediumBlue);
    }

    if (merchant.toLowerCase().contains('livraria')) {
      return Icon(Icons.book_online_outlined, color: AppTheme.mediumBlue);
    }

    if (merchant.toLowerCase().contains('supermercado')) {
      return Icon(Icons.shopping_bag_outlined, color: AppTheme.mediumBlue);
    }

    return Icon(Icons.credit_card_off_outlined, color: AppTheme.mediumBlue);
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');

    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');

    return "$day/$month às $hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withAlpha(40),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _getIconForMerchant(transaction.merchant),
          ),
          Expanded(
            flex: 5,
            child: Text.rich(
              TextSpan(
                text: '${transaction.merchant}\n',
                style: AppTheme.textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: _formatDate(transaction.dateTime),
                    style: AppTheme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text.rich(
              textAlign: TextAlign.end,
              TextSpan(
                text: 'R\$ ${transaction.amount.toStringAsFixed(2)}\n\t',
                style: AppTheme.textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'em ${transaction.installments}x',
                    style: AppTheme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
