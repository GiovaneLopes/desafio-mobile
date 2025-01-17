// Mocks generated by Mockito 5.4.2 from annotations
// in app_dictionary/test/features/word_details/domain/usecases/get_word_details_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:app_dictionary/features/word_details/domain/entities/word.dart'
    as _i5;
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetWordDetailsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWordDetailsRepository extends _i1.Mock
    implements _i3.GetWordDetailsRepository {
  @override
  _i4.Future<_i2.Either<Exception, _i5.Word>> getWordDetails(String? word) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWordDetails,
          [word],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, _i5.Word>>.value(
            _FakeEither_0<Exception, _i5.Word>(
          this,
          Invocation.method(
            #getWordDetails,
            [word],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<Exception, _i5.Word>>.value(
                _FakeEither_0<Exception, _i5.Word>(
          this,
          Invocation.method(
            #getWordDetails,
            [word],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, _i5.Word>>);
  @override
  _i4.Future<_i2.Either<Exception, void>> setFavoriteWord(_i5.Word? word) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFavoriteWord,
          [word],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, void>>.value(
            _FakeEither_0<Exception, void>(
          this,
          Invocation.method(
            #setFavoriteWord,
            [word],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<Exception, void>>.value(
                _FakeEither_0<Exception, void>(
          this,
          Invocation.method(
            #setFavoriteWord,
            [word],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, void>>);
}
