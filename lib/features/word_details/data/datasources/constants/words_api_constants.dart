class WordsApiConstants {
  static getUrl(String word) => 'https://wordsapiv1.p.rapidapi.com/words/$word';
  static const String headerKey = 'X-RapidAPI-Key';
  static const String headerHost = 'X-RapidAPI-Host';
  static const String headerHostContent = 'wordsapiv1.p.rapidapi.com';
  static const String envApiKey = 'WORDS_API_KEY';
  static const String get = 'GET';
}
