import 'package:app_dictionary/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:app_dictionary/features/favorites/data/repositories/favorites_repository_imp.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorites_repository_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoritesLocalDatasource>()])
void main() {
  final datasource = MockFavoritesLocalDatasource();
  final repository = FavoritesRepositoryImp(datasource);
  final List<WordModel> words = [
    WordModel(word: 'word', definitions: [], pronunciation: '', frequency: 1)
  ];

  test('Should return List<Word>', () async {
    when(datasource.getFavorites()).thenAnswer((realInvocation) async => words);
    final result = await repository.getFavoritesList();
    expect(result.fold(id, id), isInstanceOf<List<WordModel>>());
  });
}
