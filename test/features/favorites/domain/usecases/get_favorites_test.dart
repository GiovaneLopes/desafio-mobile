import 'package:app_dictionary/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:app_dictionary/features/favorites/domain/usecases/get_favorites.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FavoritesRepository>()])
import 'get_favorites_test.mocks.dart';

void main() {
  final repository = MockFavoritesRepository();
  final usecase = GetFavoritesUsecaseImp(repository);

  test('Should return a List<Word>', () async {
    when(repository.getFavoritesList())
        .thenAnswer((realInvocation) async => const Right(<Word>[]));

    final result = await usecase();
    expect(result.fold(id, id), isInstanceOf<List<Word>>());
  });
}
