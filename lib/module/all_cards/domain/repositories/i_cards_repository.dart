import 'package:creditcard/module/all_cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/app/core/controllers/either.dart';

abstract class ICardsRepository {
  Future<Either<Exception, List<CardEntity>>> getAllCards();
}
