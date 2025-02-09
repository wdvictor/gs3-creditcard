import 'package:creditcard/module/cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/cards/domain/entities/transaction_entity.dart';
import 'package:creditcard/module/cards/domain/repositories/i_cards_repository.dart';
import 'package:creditcard/module/cards/domain/usecases/i_cards_usecase.dart';
import 'package:creditcard/module/app/core/controllers/either.dart';

class CardsUsecases extends ICardsUsecase {
  CardsUsecases({required this.repository});

  final ICardsRepository repository;

  @override
  Future<Either<Exception, List<CardEntity>>> getAllCards() {
    return repository.getAllCards();
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getLastTransactions(int cardNumber) {
    return repository.getLastTransactions(cardNumber);
  }
}
