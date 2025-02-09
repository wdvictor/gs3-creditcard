class TransactionEntity {
  TransactionEntity({
    required this.dateTime,
    required this.amount,
    required this.merchant,
    required this.installments,
  });

  final String dateTime;
  final double amount;
  final String merchant;
  final int installments;
}
