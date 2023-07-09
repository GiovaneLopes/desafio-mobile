import 'package:app_dictionary/features/word_details/data/datasources/constants/words_api_constants.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class WordsApiRemoteDatasource {
  Future<Word> call(String word);
}

class WordsApiRemoteDatasourceImp implements WordsApiRemoteDatasource {
  @override
  Future<Word> call(String word) async {
    try {
      final url = WordsApiConstants.getUrl(word);
      final headers = {
        WordsApiConstants.headerKey: dotenv.get(WordsApiConstants.envApiKey),
        WordsApiConstants.headerHost: WordsApiConstants.headerHostContent,
      };

      final options = http.Request('GET', Uri.parse(url));
      options.headers.addAll(headers);

      final response = await http.Client().send(options);
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final data = responseData.body;
        final word = WordModel.fromJson(data);
        return word;
      } else {
        return Word(
            word: word,
            definitions: [],
            pronunciation: '',
            frequency: 0,
            isFavorited: false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
