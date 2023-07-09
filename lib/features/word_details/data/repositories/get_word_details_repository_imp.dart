import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart';
import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetWordDetailsRepositoryImp implements GetWordDetailsRepository {
  final WordsApiRemoteDatasource remoteDatasource;
  final LocalWordsDatasource localDatasource;

  GetWordDetailsRepositoryImp(this.remoteDatasource, this.localDatasource);
  @override
  Future<Either<Exception, Word>> getWordDetails(String word) async {
    try {
      final localWord = await localDatasource.getCachedWord(word);
      if (localWord == null) {
        final response = await remoteDatasource(word);
        await localDatasource.cacheWord(WordModel.fromEntity(response));
        return Right(response);
      } else {
        return Right(localWord);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Exception, void>> setFavoriteWord(Word word) async {
    try {
      await localDatasource.setFavoriteWord(
          WordModel.fromEntity(word).copyWith(isFavorited: true));
      return const Right(null);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> removeFavorite(Word word) async {
    try {
      await localDatasource.setFavoriteWord(
          WordModel.fromEntity(word).copyWith(isFavorited: false));
      return const Right(null);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
