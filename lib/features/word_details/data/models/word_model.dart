import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_dictionary/features/word_details/domain/entities/word.dart';

class WordModel extends Word {
  WordModel({
    super.id,
    required super.word,
    required super.definitions,
    required super.pronunciation,
    required super.frequency,
    required super.isFavorited,
  });

  WordModel copyWith({
    String? id,
    String? word,
    List<String>? definitions,
    String? pronunciation,
    double? frequency,
    bool? isFavorited,
  }) {
    return WordModel(
        id: id ?? this.id,
        word: word ?? this.word,
        definitions: definitions ?? this.definitions,
        pronunciation: pronunciation ?? this.pronunciation,
        frequency: frequency ?? this.frequency,
        isFavorited: isFavorited ?? this.isFavorited);
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'definitions': definitions,
      'pronunciation': pronunciation,
      'frequency': frequency,
      'isFavorited': isFavorited,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    String? pronunciation;
    if (map['pronunciation'] is String) {
      pronunciation = map['pronunciation'];
    } else if (map['pronunciation'] is Map<String, dynamic>) {
      pronunciation = map['pronunciation']['all'];
    }
    return WordModel(
      id: map['id'],
      word: map['word'] ?? '',
      definitions: map['results'] != null
          ? (map['results'] as List)
              .map((e) => e['definition'] as String)
              .toList()
          : <String>[],
      pronunciation: pronunciation ?? '',
      frequency: map['frequency']?.toDouble() ?? 0.0,
      isFavorited: map['isFavorited'] ?? false,
    );
  }

  factory WordModel.fromCache(Map<String, dynamic> map) {
    return WordModel(
      id: map['id'] ?? '',
      word: map['word'] ?? '',
      definitions: map['definitions'] != null
          ? List<String>.from(
              map['definitions']?.map((x) => x as String),
            )
          : <String>[],
      pronunciation: map['pronunciation'] ?? '',
      frequency: map['frequency']?.toDouble() ?? 0.0,
      isFavorited: map['isFavorited'] ?? false,
    );
  }

  factory WordModel.fromEntity(Word entity) {
    return WordModel(
      id: entity.id,
      word: entity.word,
      definitions: entity.definitions,
      pronunciation: entity.pronunciation,
      frequency: entity.frequency,
      isFavorited: entity.isFavorited,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WordModel(word: $word, definitions: $definitions, pronunciation: $pronunciation, frequency: $frequency, isFavorited: $isFavorited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel &&
        other.word == word &&
        listEquals(other.definitions, definitions) &&
        other.pronunciation == pronunciation &&
        other.frequency == frequency &&
        other.isFavorited == isFavorited;
  }

  @override
  int get hashCode {
    return word.hashCode ^
        definitions.hashCode ^
        pronunciation.hashCode ^
        frequency.hashCode ^
        isFavorited.hashCode;
  }
}
