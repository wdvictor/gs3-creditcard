import 'package:creditcard/module/cards/data/cards_datasource.dart';
import 'package:creditcard/module/cards/domain/entities/card_entity.dart';
import 'package:creditcard/module/cards/domain/usecases/i_cards_usecase.dart';
import 'package:creditcard/module/cards/infra/repositories/card_repository.dart';
import 'package:creditcard/module/cards/infra/usecases/cards_usecases.dart';
import 'package:creditcard/module/app/core/controllers/custom_controller.dart';

class CardsController extends CustomController<Exception, List<CardEntity>> {
  CardsController(super.value);

  final ICardsUsecase _usecase = CardsUsecases(
    repository: CardsRepository(
      datasource: CardsDatasource(),
    ),
  );

  Future<void> getAllCards() async {
    await execute(() => _usecase.getAllCards());
  }
}
