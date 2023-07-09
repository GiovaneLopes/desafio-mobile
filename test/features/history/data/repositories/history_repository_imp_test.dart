import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart';
import 'package:app_dictionary/features/history/data/repository/history_repository_imp.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../word_details/data/repositories/get_word_details_repository_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LocalWordsDatasource>()])
void main() {
  final datasource = MockLocalWordsDatasource();
  final repository = HistoryRepositoryImp(datasource);
  final List<WordModel> word = [
      WordModel(
        word: 'word',
        definitions: [],
        pronunciation: '',
        frequency: 1.0,
        isFavorited: false)
  ];

  test('Should return a List<WordModel>', () async {
    when(datasource.getCachedWordsList()).thenAnswer((_) async => word);

    final result = await repository();
    expect(result.fold(id, id), isInstanceOf<List<WordModel>>());
  });
}
