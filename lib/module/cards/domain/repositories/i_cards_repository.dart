import 'package:creditcard/module/cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/cards/domain/entities/transaction_entity.dart';
import 'package:creditcard/module/app/core/controllers/either.dart';

abstract class ICardsRepository {
  Future<Either<Exception, List<CardEntity>>> getAllCards();
  Future<Either<Exception, List<TransactionEntity>>> getLastTransactions(
    int cardNumber,
  );
}
