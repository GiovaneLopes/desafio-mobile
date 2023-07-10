import 'package:app_dictionary/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:app_dictionary/features/auth/data/datasources/constants/firebase_keys.dart';
import 'package:app_dictionary/features/auth/data/erros/auth_failures.dart';
import 'package:app_dictionary/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthRemoteDatasource {
  Future<void> registration(UserModel userModel, String password);
  Future<void> login(String email, String password);
  Future<void> signOut();
}

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  final AuthLocalDatasource authLocalDatasource;
  late final FirebaseAuth firebaseAuth;
  late final FirebaseDatabase firebaseDatabase;
  AuthRemoteDatasourceImp(this.authLocalDatasource) {
    init();
    defineNavigation();
  }

  void init() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseDatabase = FirebaseDatabase.instance;
  }

  defineNavigation() async {
    DatabaseReference userRef;
    final userCached = await authLocalDatasource.getUser();
    if (userCached == null) {
      firebaseAuth.userChanges().listen((user) async {
        if (user != null) {
          userRef = firebaseDatabase
              .ref()
              .child('Users')
              .child(firebaseAuth.currentUser!.uid);
          final response = await userRef.get();
          final userData = UserModel.fromDataSnapshot(response);
          await authLocalDatasource.cacheUser(userData);
          return Modular.to.navigate('/home');
        }
        return Modular.to.navigate('/');
      });
    } else {
      return Modular.to.navigate('/home');
    }
  }

  @override
  Future<void> registration(UserModel userModel, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);
      final firebaseUser = userCredential.user;
      DatabaseReference userReference = firebaseDatabase
          .ref()
          .child(FirebaseKeys.users)
          .child(firebaseUser!.uid);
      userModel = userModel.copyWith(id: firebaseUser.uid);
      await userReference.set(userModel.toMap());
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseKeys.emailAlreadyInUseErrorMessage) {
        throw UserAlreadyInUse();
      }
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseKeys.wrongPasswordErrorMessage) {
        throw WrongPassword();
      }
      if (e.code == FirebaseKeys.userNotFoundErrorMessage) {
        throw UserNotFound();
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await authLocalDatasource.signOut();
      defineNavigation();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
