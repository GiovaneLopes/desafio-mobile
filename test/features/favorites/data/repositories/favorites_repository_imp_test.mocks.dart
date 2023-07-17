// Mocks generated by Mockito 5.4.2 from annotations
// in app_dictionary/test/features/favorites/data/repositories/favorites_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart'
    as _i2;
import 'package:app_dictionary/features/word_details/data/models/word_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LocalWordsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalWordsDatasource extends _i1.Mock
    implements _i2.LocalWordsDatasource {
  @override
  _i3.Future<void> cacheWord(_i4.WordModel? word) => (super.noSuchMethod(
        Invocation.method(
          #cacheWord,
          [word],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<_i4.WordModel?> getCachedWord(String? word) => (super.noSuchMethod(
        Invocation.method(
          #getCachedWord,
          [word],
        ),
        returnValue: _i3.Future<_i4.WordModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.WordModel?>.value(),
      ) as _i3.Future<_i4.WordModel?>);
  @override
  _i3.Future<List<_i4.WordModel>> getCachedWordsList() => (super.noSuchMethod(
        Invocation.method(
          #getCachedWordsList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.WordModel>>.value(<_i4.WordModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.WordModel>>.value(<_i4.WordModel>[]),
      ) as _i3.Future<List<_i4.WordModel>>);
  @override
  _i3.Future<List<_i4.WordModel>> getFavoritesList() => (super.noSuchMethod(
        Invocation.method(
          #getFavoritesList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.WordModel>>.value(<_i4.WordModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.WordModel>>.value(<_i4.WordModel>[]),
      ) as _i3.Future<List<_i4.WordModel>>);
}