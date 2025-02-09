import 'package:creditcard/module/cards/domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  CardModel({
    required super.cardNumber,
    required super.name,
    required super.brand,
    required super.bestPurchaseDate,
    required super.availableLimit,
  });

  factory CardModel.fromMap(Map map) {
    return CardModel(
      cardNumber: map['numero'],
      name: map['nome'],
      brand: map['bandeira'],
      bestPurchaseDate: map['melhor_data_compra'],
      availableLimit: map['limite_disponivel'].toDouble(),
    );
  }
}
