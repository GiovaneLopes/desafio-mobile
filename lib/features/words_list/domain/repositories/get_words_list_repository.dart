import 'package:dartz/dartz.dart';

abstract class GetWordsListRepository {
  Future<Either<Exception, List<String>>> call();
}
