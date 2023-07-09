import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class GetWordDetailsRepository {
  Future<Either<Exception, Word>> getWordDetails(String word);
  Future<Either<Exception, void>> setFavoriteWord(Word word);
  Future<Either<Exception, void>> removeFavorite(Word word);
}
