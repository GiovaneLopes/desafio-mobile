import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../features/word_details/data/repositories/get_word_details_repository_imp_test.mocks.dart';

void main() {
  final datasource = MockLocalWordsDatasource();
  String wordText = 'door';
  final WordModel wordModel = WordModel(
    id:null,
    word: wordText,
    definitions: [],
    pronunciation: '',
    frequency: 1.0,
    isFavorited: false,
  );

  test('Should return a WordModel', () async {
    when(datasource.getCachedWord(wordText))
        .thenAnswer((realInvocation) async => wordModel);
    final result = await datasource.getCachedWord(wordText);
    expect(result, isInstanceOf<WordModel>());
  });

  test('Should return a void', () async {
    when(datasource.cacheWord(wordModel))
        .thenAnswer((realInvocation) async => await null);
    final result = datasource.cacheWord(wordModel);
    expect(result, isA<Future<void>>());
  });
}
