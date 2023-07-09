import 'dart:convert';

import 'package:app_dictionary/core/datasources/local_words_datasource/constants/words_api_constants.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalWordsDatasource {
  Future<void> cacheWord(WordModel word);
  Future<WordModel?> getCachedWord(String word);
  Future<List<WordModel>> getCachedWordsList();
  Future<List<WordModel>> getFavoritesList();
  Future<void> setFavoriteWord(WordModel word);
}

class LocalWordsDatasourceImp implements LocalWordsDatasource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  LocalWordsDatasourceImp();

  @override
  Future<void> cacheWord(WordModel word) async {
    final SharedPreferences prefs = await _preferences;
    List<WordModel> words = await _getCachedWordList();
    words.add(word);
    await prefs.setString(
        WordsLocalConstants.localWordsList, jsonEncode(words));
  }

  @override
  Future<WordModel?> getCachedWord(String word) async {
    List<WordModel> words = await _getCachedWordList();
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
    List<WordModel> words = await _getCachedWordList();
    return words;
  }

  @override
  Future<List<WordModel>> getFavoritesList() async {
    List<WordModel> words = await _getCachedWordList();
    List<WordModel> favorites = [];
    words.map((word) {
      if (word.isFavorited) {
        favorites.add(word);
      }
    }).toList();
    return favorites;
  }

  @override
  Future<void> setFavoriteWord(WordModel word) async {
    final SharedPreferences prefs = await _preferences;
    List<WordModel> words = await _getCachedWordList();
    for (int i = 0; i < words.length; i++) {
      if (words[i].word == word.word) {
        words[i] = word;
      }
    }
    await prefs.setString(
        WordsLocalConstants.localWordsList, jsonEncode(words));
  }

  Future<List<WordModel>> _getCachedWordList() async {
    final SharedPreferences prefs = await _preferences;
    final String? jsonList =
        prefs.getString(WordsLocalConstants.localWordsList);
    if (jsonList == null) {
      return <WordModel>[];
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
      return words;
    }
  }
}
