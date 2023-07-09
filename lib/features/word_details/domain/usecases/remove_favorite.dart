import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RemoveFavoriteUsecase {
  Future<Either<Exception, void>> call(Word word);
}

class RemoveFavoriteUsecaseImp implements RemoveFavoriteUsecase {
  final GetWordDetailsRepository repository;

  RemoveFavoriteUsecaseImp(this.repository);

  @override
  Future<Either<Exception, void>> call(Word word) async {
    return await repository.removeFavorite(word);
  }
}
