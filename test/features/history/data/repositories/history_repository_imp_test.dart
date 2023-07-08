import 'package:app_dictionary/features/history/data/repository/history_repository_imp.dart';
import 'package:app_dictionary/features/word_details/data/datasources/word_details_local_datasource.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../word_details/data/repositories/get_word_details_repository_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WordDetailsLocalDatasource>()])
void main() {
  final datasource = MockWordDetailsLocalDatasource();
  final repository = HistoryRepositoryImp(datasource);
  final List<WordModel> word = [
    WordModel(
        word: "door", definitions: [], pronunciation: 'dour', frequency: 1.0)
  ];

  test('Should return a List<WordModel>', () async {
    when(datasource.getCachedWordsList()).thenAnswer((_) async => word);

    final result = await repository();
    expect(result.fold(id, id), isInstanceOf<List<WordModel>>());
  });
}
