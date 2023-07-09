import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart';
import 'package:app_dictionary/features/history/domain/repositories/history_repository.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

class HistoryRepositoryImp implements HistoryRepository {
  final LocalWordsDatasource localDatasource;

  HistoryRepositoryImp(this.localDatasource);

  @override
  Future<Either<Exception, List<Word>>> call() async {
    try {
      final response = await localDatasource.getCachedWordsList();
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
