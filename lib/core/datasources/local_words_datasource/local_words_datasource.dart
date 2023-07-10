import 'dart:convert';

import 'package:app_dictionary/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:app_dictionary/features/auth/data/datasources/constants/firebase_keys.dart';
import 'package:app_dictionary/features/auth/data/erros/auth_failures.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class LocalWordsDatasource {
  Future<void> cacheWord(WordModel word);
  Future<WordModel?> getCachedWord(String word);
  Future<List<WordModel>> getCachedWordsList();
  Future<List<WordModel>> getFavoritesList();
  Future<void> setFavoriteWord(WordModel word);
}

class LocalWordsDatasourceImp implements LocalWordsDatasource {
  late final FirebaseDatabase database;
  final AuthLocalDatasource authLocalDatasource;
  LocalWordsDatasourceImp(this.authLocalDatasource) {
    database = FirebaseDatabase.instance;
  }

  @override
  Future<void> cacheWord(WordModel word) async {
    final localUser = await authLocalDatasource.getUser();
    DatabaseReference userReference =
        database.ref().child('Words').child(localUser!.id!);
    final newWordReference = userReference.push();
    newWordReference.set(word.toMap());
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
    final localUser = await authLocalDatasource.getUser();
    DatabaseReference userReference =
        database.ref().child('Words').child(localUser!.id!).child(word.id!);
    await userReference.update(word.toMap());
  }

  Future<List<WordModel>> _getCachedWordList() async {
    try {
      final localUser = await authLocalDatasource.getUser();
      DatabaseReference wordsReference =
          database.ref().child('Words').child(localUser!.id!);
      final response = await wordsReference.get();
      List<WordModel> list = [];
      if (response.value != null) {
        final map = response.value as Map;
        map.forEach((key, value) {
          final word = WordModel.fromCache(jsonDecode(jsonEncode(value)));
          list.add(word.copyWith(id: key));
        });
      }
      return list;
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseKeys.emailAlreadyInUseErrorMessage) {
        throw UserAlreadyInUse();
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
