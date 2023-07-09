import 'package:app_dictionary/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:app_dictionary/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

class FavoritesRepositoryImp implements FavoritesRepository {
  final FavoritesLocalDatasource datasource;

  FavoritesRepositoryImp(this.datasource);

  @override
  Future<Either<Exception, List<Word>>> getFavoritesList() async {
    try {
      final response = await datasource.getFavorites();
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> setFavoriteWord(Word word) async {
    try {
      final response = await datasource.setFavoriteWord(word);
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
