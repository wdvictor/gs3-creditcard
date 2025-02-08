import 'dart:convert';

import 'package:creditcard/module/all_cards/infra/datasource/i_cards_datasource.dart';
import 'package:creditcard/module/app/core/controllers/either.dart';
import 'package:flutter/services.dart';

class CardsDatasource extends ICardsDatasource {
  @override
  Future<Either<Map, Map>> getAllCards() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/cartoes.json',
      );
      final Map<String, dynamic> data = jsonDecode(response);

      return Either.right(data);
    } catch (e) {
      return Either.left({
        'error': 'Erro ao carregar o arquivo JSON',
        'details': e.toString(),
      });
    }
  }
}
