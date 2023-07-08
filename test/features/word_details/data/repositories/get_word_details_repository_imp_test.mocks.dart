// Mocks generated by Mockito 5.4.2 from annotations
// in app_dictionary/test/features/word_details/data/repositories/get_word_details_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:app_dictionary/features/word_details/data/datasources/word_details_local_datasource.dart'
    as _i5;
import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart'
    as _i3;
import 'package:app_dictionary/features/word_details/data/models/word_model.dart'
    as _i6;
import 'package:app_dictionary/features/word_details/domain/entities/word.dart'
    as _i2;
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

class _FakeWord_0 extends _i1.SmartFake implements _i2.Word {
  _FakeWord_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WordsApiRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWordsApiRemoteDatasource extends _i1.Mock
    implements _i3.WordsApiRemoteDatasource {
  @override
  _i4.Future<_i2.Word> call(String? word) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [word],
        ),
        returnValue: _i4.Future<_i2.Word>.value(_FakeWord_0(
          this,
          Invocation.method(
            #call,
            [word],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Word>.value(_FakeWord_0(
          this,
          Invocation.method(
            #call,
            [word],
          ),
        )),
      ) as _i4.Future<_i2.Word>);
}

/// A class which mocks [WordDetailsLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWordDetailsLocalDatasource extends _i1.Mock
    implements _i5.WordDetailsLocalDatasource {
  @override
  _i4.Future<void> cacheWord(_i6.WordModel? word) => (super.noSuchMethod(
        Invocation.method(
          #cacheWord,
          [word],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i6.WordModel?> getCachedWord(String? word) => (super.noSuchMethod(
        Invocation.method(
          #getCachedWord,
          [word],
        ),
        returnValue: _i4.Future<_i6.WordModel?>.value(),
        returnValueForMissingStub: _i4.Future<_i6.WordModel?>.value(),
      ) as _i4.Future<_i6.WordModel?>);
  @override
  _i4.Future<List<_i6.WordModel>> getCachedWordsList() => (super.noSuchMethod(
        Invocation.method(
          #getCachedWordsList,
          [],
        ),
        returnValue: _i4.Future<List<_i6.WordModel>>.value(<_i6.WordModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i6.WordModel>>.value(<_i6.WordModel>[]),
      ) as _i4.Future<List<_i6.WordModel>>);
}
