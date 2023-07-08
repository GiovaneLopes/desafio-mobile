import 'package:app_dictionary/features/history/domain/repositories/history_repository.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class GetHistoryListUsecase {
  Future<Either<Exception, List<Word>>> call();
}

class GetHistoryListUsecaseImp implements GetHistoryListUsecase {
  final HistoryRepository repository;

  GetHistoryListUsecaseImp(this.repository);
  @override
  Future<Either<Exception, List<Word>>> call() async {
    return await repository();
  }
}
