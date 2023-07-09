import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart';
import 'package:app_dictionary/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

class FavoritesRepositoryImp implements FavoritesRepository {
  final LocalWordsDatasource datasource;

  FavoritesRepositoryImp(this.datasource);

  @override
  Future<Either<Exception, List<Word>>> getFavoritesList() async {
    try {
      final response = await datasource.getFavoritesList();
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
