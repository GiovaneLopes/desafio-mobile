import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetWordDetailsUsecase {
  Future<Either<Exception, Word>> call(String word);
}

class GetWordDetailsUsecaseImp implements GetWordDetailsUsecase {
  final GetWordDetailsRepository repository;

  GetWordDetailsUsecaseImp(this.repository);
  @override
  Future<Either<Exception, Word>> call(String word) async {
    return await repository(word);
  }
}
