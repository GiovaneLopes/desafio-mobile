import 'dart:convert';

import 'package:app_dictionary/features/word_details/data/datasources/constants/words_api_constants.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WordDetailsLocalDatasource {
  Future<void> cacheWord(WordModel word);
  Future<WordModel?> getCachedWord(String word);
  Future<List<WordModel>> getCachedWordsList();
}

class WordDetailsLocalDatasourceImp implements WordDetailsLocalDatasource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  WordDetailsLocalDatasourceImp();

  @override
  Future<void> cacheWord(WordModel word) async {
    final SharedPreferences prefs = await _preferences;
    final String? jsonList = prefs.getString(WordsApiConstants.localWordsList);
    if (jsonList == null) {
      await prefs.setString(
          WordsApiConstants.localWordsList, jsonEncode([word.toMap()]));
    } else {
      final map = jsonDecode(jsonList);
      List<WordModel> words = [];
      map.map((wordItem) {
        if (wordItem is String) {
          words.add(WordModel.fromCache(jsonDecode(wordItem)));
        } else if (wordItem is Map<String, dynamic>) {
          words.add(WordModel.fromCache(wordItem));
        }
      }).toList();
      words.add(word);
      await prefs.setString(
          WordsApiConstants.localWordsList, jsonEncode(words));
    }
  }

  @override
  Future<WordModel?> getCachedWord(String word) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonList = prefs.getString('words-list') ?? '';
    if (jsonList.isEmpty) {
      return null;
    }
    final map = jsonDecode(jsonList);
    List<WordModel> words = [];
    map.map((wordItem) {
      if (wordItem is String) {
        words.add(WordModel.fromCache(jsonDecode(wordItem)));
      } else if (wordItem is Map<String, dynamic>) {
        words.add(WordModel.fromCache(wordItem));
      }
    }).toList();
    WordModel? selectedWord;
    words.map((wordItem) {
      if (wordItem.word == word) {
        selectedWord = wordItem;
      }
    }).toList();
    return selectedWord;
  }

  @override
  Future<List<WordModel>> getCachedWordsList() async {
    final SharedPreferences prefs = await _preferences;
    final String? jsonList = prefs.getString(WordsApiConstants.localWordsList);

    if (jsonList != null) {}
    final map = jsonDecode(jsonList!);
    List<WordModel> words = [];
    map.map((wordItem) {
      if (wordItem is String) {
        words.add(WordModel.fromCache(jsonDecode(wordItem)));
      } else if (wordItem is Map<String, dynamic>) {
        words.add(WordModel.fromCache(wordItem));
      }
    }).toList();
    return words;
  }
}
