import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TransactionDayTitle extends StatelessWidget {
  const TransactionDayTitle({super.key, required this.date});
  final String date;

  String _getDate(String date) {
    List<String> dateSliplted = date.split('/');
    String day = dateSliplted[0];
    String month = dateSliplted[1];

    Map<String, String> monthsAbreviation = {
      "01": "Jan",
      "02": "Fev",
      "03": "Mar",
      "04": "Abr",
      "05": "Mai",
      "06": "Jun",
      "07": "Jul",
      "08": "Ago",
      "09": "Set",
      "10": "Out",
      "11": "Nov",
      "12": "Dez"
    };

    return '$day ${monthsAbreviation[month]}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _getDate(date),
        style: AppTheme.textTheme.titleSmall!.copyWith(color: Colors.blue),
      ),
    );
  }
}
