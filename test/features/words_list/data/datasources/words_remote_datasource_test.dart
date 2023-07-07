import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repositories/get_words_list_repository_imp_test.mocks.dart';

void main() {
  final datasource = MockWordsRemoteDatasource();
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  test('Should return List of Strings', () async {
    when(datasource()).thenAnswer((realInvocation) async => <String>[]);
    final result = await datasource();
    expect(result, isInstanceOf<List<String>>());
  });
}
