class CardEntity {
  CardEntity({
    required this.cardNumber,
    required this.name,
    required this.brand,
    required this.bestPurchaseDate,
    required this.availableLimit,
  });

  final String cardNumber;
  final String name;
  final String brand;
  final String bestPurchaseDate;
  final double availableLimit;
}
