import 'package:creditcard/module/app/core/controllers/either.dart';

abstract class ICardsDatasource {
  Future<Either<Map, Map>> getAllCards();
}
