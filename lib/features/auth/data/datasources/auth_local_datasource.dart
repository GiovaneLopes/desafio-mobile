import 'dart:convert';

import 'package:app_dictionary/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> signOut();
}

class AuthLocalDatasourceImp implements AuthLocalDatasource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      final SharedPreferences prefs = await _preferences;
      final userJson = UserModel.fromEntity(user).toJson();
      await prefs.setString('user', userJson);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userJson = prefs.getString('user') ?? '';
      if (userJson.isEmpty) {
        return null;
      }
      return UserModel.fromMap(jsonDecode(userJson));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      rethrow;
    }
  }
}
