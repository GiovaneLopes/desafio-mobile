import 'dart:convert';

import 'package:app_dictionary/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.name,
    required super.email,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return UserModel(
      id: id ?? id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode;
  }

  factory UserModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    Map<dynamic, dynamic> userMap = dataSnapshot.value as Map;
    userMap['id'] = dataSnapshot.key;

    return UserModel.fromJson(jsonEncode(userMap));
  }
}
