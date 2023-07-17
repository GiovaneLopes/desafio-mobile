import 'package:app_dictionary/features/words_list/domain/repositories/get_words_list_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetWordsListUsecase {
  Future<Either<Exception, List<String>>> call();
}

class GetWordsListUsecaseImp implements GetWordsListUsecase {
  final GetWordsListRepository repository;
  GetWordsListUsecaseImp(this.repository);

  @override
  Future<Either<Exception, List<String>>> call() async {
    return await repository();
  }
}
