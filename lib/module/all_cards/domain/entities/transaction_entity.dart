class TransactionEntity {
  TransactionEntity({
    required this.dateTime,
    required this.amount,
    required this.merchant,
    required this.installments,
  });

  final String dateTime;
  final String amount;
  final String merchant;
  final DateTime installments;
}
