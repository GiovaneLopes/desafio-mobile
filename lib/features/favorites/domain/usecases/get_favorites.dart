import 'package:app_dictionary/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class GetFavoritesUsecase {
  Future<Either<Exception, List<Word>>> call();
}

class GetFavoritesUsecaseImp implements GetFavoritesUsecase {
  final FavoritesRepository repository;

  GetFavoritesUsecaseImp(this.repository);

  @override
  Future<Either<Exception, List<Word>>> call() async {
    return await repository.getFavoritesList();
  }
}
