import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepository {
  Future<Either<Exception, List<Word>>> getFavoritesList();
  Future<Either<Exception, void>> setFavoriteWord(Word word);
}
