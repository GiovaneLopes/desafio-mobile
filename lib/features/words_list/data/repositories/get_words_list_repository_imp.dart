import 'package:app_dictionary/features/words_list/data/datasources/words_remote_datasource.dart';
import 'package:app_dictionary/features/words_list/domain/repositories/get_words_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetWordsListRepositoryImp extends GetWordsListRepository {
  final WordsRemoteDatasource datasource;

  GetWordsListRepositoryImp(this.datasource);
  @override
  Future<Either<Exception, List<String>>> call() async {
    try {
      final response = await datasource();
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
