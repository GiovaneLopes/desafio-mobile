import 'package:app_dictionary/features/history/domain/repositories/history_repository.dart';
import 'package:app_dictionary/features/word_details/data/datasources/word_details_local_datasource.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

class HistoryRepositoryImp implements HistoryRepository {
  final WordDetailsLocalDatasource localDatasource;

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
