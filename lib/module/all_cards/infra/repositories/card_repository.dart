import 'package:creditcard/module/all_cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/all_cards/domain/repositories/i_cards_repository.dart';
import 'package:creditcard/module/all_cards/infra/datasource/i_cards_datasource.dart';
import 'package:creditcard/module/all_cards/infra/models/card_model.dart';

import 'package:creditcard/module/app/core/controllers/either.dart';

class CardsRepository extends ICardsRepository {
  CardsRepository({required this.datasource});

  final ICardsDatasource datasource;

  @override
  Future<Either<Exception, List<CardEntity>>> getAllCards() {
    return datasource.getAllCards().then((value) {
      return value.fold((l) => Either.left(Exception(l)), (r) {
        try {
          final List<dynamic> cardsList = r['cartoes'];
          var cards = cardsList
              .map(
                (json) => CardModel.fromMap(json),
              )
              .toList();
          return Either.right(cards);
        } catch (e) {
          return Either.left(Exception('Convert data error: $e'));
        }
      });
    });
  }
}
