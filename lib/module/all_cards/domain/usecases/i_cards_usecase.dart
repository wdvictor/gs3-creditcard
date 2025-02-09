import 'package:creditcard/module/all_cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/all_cards/domain/entities/transaction_entity.dart';
import 'package:creditcard/module/app/core/controllers/either.dart';

abstract class ICardsUsecase {
  Future<Either<Exception, List<CardEntity>>> getAllCards();
  Future<Either<Exception, List<TransactionEntity>>> getLastTransactions(
    int cardNumber,
  );
}
