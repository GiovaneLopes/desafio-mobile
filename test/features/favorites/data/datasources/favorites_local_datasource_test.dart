import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repositories/favorites_repository_imp_test.mocks.dart';

void main() {
  final datasource = MockFavoritesLocalDatasource();

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  test('Should return List<WordModel>', () async {
    when(datasource.getFavorites())
        .thenAnswer((realInvocation) async => <WordModel>[]);
    final result = await datasource.getFavorites();
    expect(result, isInstanceOf<List<WordModel>>());
  });
}
