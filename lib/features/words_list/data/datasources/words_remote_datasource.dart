import 'dart:convert';

import 'package:app_dictionary/features/words_list/data/contants/words_list_data_constants.dart';
import 'package:flutter/services.dart';

abstract class WordsRemoteDatasource {
  Future<List<String>> call();
}

class WordsRemoteDatasourceImp implements WordsRemoteDatasource {
  WordsRemoteDatasourceImp();

  int pageNumber = 1;
  final pageSize = 50;
  @override
  Future<List<String>> call() async {
    try {
      String data =
          await rootBundle.loadString(WordsListDataConstants.wordsDictionary);
      final json = jsonDecode(data);
      List<String> wordsTemp = <String>[];
      (json as Map<String, dynamic>).forEach((key, value) {
        wordsTemp.add(key);
      });
      final start = (pageNumber - 1) * pageSize;
      final end = start + pageSize;
      pageNumber = pageNumber + 1;
      return wordsTemp.sublist(start, end).cast<String>();
    } catch (e) {
      rethrow;
    }
  }
}
