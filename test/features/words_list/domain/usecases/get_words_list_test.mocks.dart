// Mocks generated by Mockito 5.4.2 from annotations
// in app_dictionary/test/features/words_list/domain/usecases/get_words_list_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:app_dictionary/features/words_list/domain/repositories/get_words_list_repository.dart'
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

/// A class which mocks [GetWordsListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWordsListRepository extends _i1.Mock
    implements _i3.GetWordsListRepository {
  @override
  _i4.Future<_i2.Either<Exception, List<String>>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, List<String>>>.value(
            _FakeEither_0<Exception, List<String>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<Exception, List<String>>>.value(
                _FakeEither_0<Exception, List<String>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, List<String>>>);
}
