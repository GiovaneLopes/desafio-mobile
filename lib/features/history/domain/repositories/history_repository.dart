import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepository {
  Future<Either<Exception, List<Word>>> call();
}
