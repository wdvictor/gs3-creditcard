import 'package:creditcard/module/cards/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.dateTime,
    required super.amount,
    required super.merchant,
    required super.installments,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      dateTime: map['data_hora'],
      amount: map['valor'],
      merchant: map['empresa'],
      installments: map['parcelas'],
    );
  }
}
