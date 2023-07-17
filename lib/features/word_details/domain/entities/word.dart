class Word {
  final String? id;
  final String word;
  final List<String> definitions;
  final String pronunciation;
  final double frequency;
  final bool isFavorited;

  Word({
    this.id,
    required this.word,
    required this.definitions,
    required this.pronunciation,
    required this.frequency,
    required this.isFavorited,
  });
}
