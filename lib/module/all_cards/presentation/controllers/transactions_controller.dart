import 'package:creditcard/module/all_cards/data/cards_datasource.dart';
import 'package:creditcard/module/all_cards/domain/entities/transaction_entity.dart';
import 'package:creditcard/module/all_cards/domain/usecases/i_cards_usecase.dart';
import 'package:creditcard/module/all_cards/infra/repositories/card_repository.dart';
import 'package:creditcard/module/all_cards/infra/usecases/cards_usecases.dart';
import 'package:creditcard/module/app/core/controllers/custom_controller.dart';

class TransactionsController extends CustomController<Exception, List<TransactionEntity>> {
  TransactionsController(super.value);

  final ICardsUsecase _usecase = CardsUsecases(
    repository: CardsRepository(
      datasource: CardsDatasource(),
    ),
  );

  Future<void> getTransactions(int cardNumber) async {
    await execute(() => _usecase.getLastTransactions(cardNumber));
  }
}
