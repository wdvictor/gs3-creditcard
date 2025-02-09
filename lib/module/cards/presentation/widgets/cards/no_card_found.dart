import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NoCardFound extends StatelessWidget {
  const NoCardFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.credit_card_off,
            size: 64,
            color: AppTheme.darkBlue,
          ),
          SizedBox(height: 16),
          Text(
            'Nenhum cartão encontrado',
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
