import 'dart:convert';

import 'package:app_dictionary/features/words_list/data/contants/words_list_data_constants.dart';
import 'package:flutter/services.dart';

abstract class WordsRemoteDatasource {
  Future<List<String>> call();
}

class WordsRemoteDatasourceImp implements WordsRemoteDatasource {
  late List<String> wordsList;
  List<String>? get getWords => wordsList;

  WordsRemoteDatasourceImp();
  @override
  Future<List<String>> call() async {
    try {
      if (getWords == null) {
        String data =
            await rootBundle.loadString(WordsListDataConstants.wordsDictionary);
        final json = jsonDecode(data);
        List<String> wordsTemp = <String>[];
        (json as Map<String, dynamic>).forEach((key, value) {
          wordsTemp.add(key);
        });
        wordsList = wordsTemp;
        return wordsTemp;
      } else {
        return getWords!;
      }
    } catch (e) {
      rethrow;
    }
  }
}
