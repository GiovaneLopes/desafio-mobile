import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_dictionary/features/words_list/domain/entities/word.dart';

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
    return WordModel(
      word: map['word'] ?? '',
      definitions: List<String>.from(map['definitions']),
      pronunciation: map['pronunciation'] ?? '',
      frequency: map['frequency']?.toDouble() ?? 0.0,
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
