import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_dictionary/features/word_details/domain/entities/word.dart';

class WordModel extends Word {
  WordModel({
    required super.word,
    required super.definitions,
    required super.pronunciation,
    required super.frequency,
  });

  WordModel copyWith({
    String? word,
    List<String>? definitions,
    String? pronunciation,
    double? frequency,
  }) {
    return WordModel(
      word: word ?? this.word,
      definitions: definitions ?? this.definitions,
      pronunciation: pronunciation ?? this.pronunciation,
      frequency: frequency ?? this.frequency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'definitions': definitions,
      'pronunciation': pronunciation,
      'frequency': frequency,
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
      word: map['word'] ?? '',
      definitions: map['results'] != null
          ? (map['results'] as List)
              .map((e) => e['definition'] as String)
              .toList()
          : <String>[],
      pronunciation: pronunciation ?? '',
      frequency: map['frequency']?.toDouble() ?? 0.0,
    );
  }

  factory WordModel.fromCache(Map<String, dynamic> map) {
    return WordModel(
      word: map['word'] ?? '',
      definitions:
          (map['definitions'] as List).map((e) => e as String).toList(),
      pronunciation: map['pronunciation'] ?? '',
      frequency: map['frequency']?.toDouble() ?? 0.0,
    );
  }

  factory WordModel.fromEntity(Word entity) {
    return WordModel(
      word: entity.word,
      definitions: entity.definitions,
      pronunciation: entity.pronunciation,
      frequency: entity.frequency,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WordModel(word: $word, definitions: $definitions, pronunciation: $pronunciation, frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel &&
        other.word == word &&
        listEquals(other.definitions, definitions) &&
        other.pronunciation == pronunciation &&
        other.frequency == frequency;
  }

  @override
  int get hashCode {
    return word.hashCode ^
        definitions.hashCode ^
        pronunciation.hashCode ^
        frequency.hashCode;
  }
}