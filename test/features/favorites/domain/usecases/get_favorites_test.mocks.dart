// Mocks generated by Mockito 5.4.2 from annotations
// in app_dictionary/test/features/favorites/domain/usecases/get_favorites_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:app_dictionary/features/favorites/domain/repositories/favorites_repository.dart'
    as _i3;
import 'package:app_dictionary/features/word_details/domain/entities/word.dart'
    as _i5;
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

/// A class which mocks [FavoritesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoritesRepository extends _i1.Mock
    implements _i3.FavoritesRepository {
  @override
  _i4.Future<_i2.Either<Exception, List<_i5.Word>>> getFavoritesList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoritesList,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, List<_i5.Word>>>.value(
            _FakeEither_0<Exception, List<_i5.Word>>(
          this,
          Invocation.method(
            #getFavoritesList,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<Exception, List<_i5.Word>>>.value(
                _FakeEither_0<Exception, List<_i5.Word>>(
          this,
          Invocation.method(
            #getFavoritesList,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, List<_i5.Word>>>);
}