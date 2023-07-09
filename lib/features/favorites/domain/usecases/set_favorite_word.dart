import 'package:app_dictionary/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class SetFavoriteWord {
  Future<Either<Exception, void>> call(Word word);
}

class SetFavoriteWordImp implements SetFavoriteWord {
  final FavoritesRepository repository;

  SetFavoriteWordImp(this.repository);

  @override
  Future<Either<Exception, void>> call(Word word) async {
    return await repository.setFavoriteWord(word);
  }
}
