import 'dart:convert';

import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoritesLocalDatasource {
  Future<List<WordModel>> getFavorites();
  Future<void> setFavoriteWord(Word word);
}

class FavoritesLocalDatasourceImp implements FavoritesLocalDatasource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  FavoritesLocalDatasourceImp();
  @override
  Future<List<WordModel>> getFavorites() async {
    final SharedPreferences prefs = await _preferences;
    final String? jsonList = prefs.getString('favorites-list');
    List<WordModel> favorites = [];

    if (jsonList != null) {
      final map = jsonDecode(jsonList);
      map.map((wordItem) {
        if (wordItem is String) {
          favorites.add(WordModel.fromCache(jsonDecode(wordItem)));
        } else if (wordItem is Map<String, dynamic>) {
          favorites.add(WordModel.fromCache(wordItem));
        }
      }).toList();
    }
    return favorites;
  }

  @override
  Future<void> setFavoriteWord(Word wordEnitity) async {
    final word = WordModel.fromEntity(wordEnitity);
    final SharedPreferences prefs = await _preferences;
    final String? jsonList = prefs.getString('favorites-list');
    if (jsonList == null) {
      await prefs.setString('favorites-list', jsonEncode([word.toMap()]));
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
      await prefs.setString('favorites-list', jsonEncode(words));
    }
  }
}
