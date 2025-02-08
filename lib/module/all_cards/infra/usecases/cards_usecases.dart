import 'package:creditcard/module/all_cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/all_cards/domain/repositories/i_cards_repository.dart';
import 'package:creditcard/module/all_cards/domain/usecases/i_cards_usecase.dart';
import 'package:creditcard/module/app/core/controllers/either.dart';

class CardsUsecases extends ICardsUsecase {
  CardsUsecases({required this.repository});

  final ICardsRepository repository;

  @override
  Future<Either<Exception, List<CardEntity>>> getAllCards() {
    return repository.getAllCards();
  }
}
