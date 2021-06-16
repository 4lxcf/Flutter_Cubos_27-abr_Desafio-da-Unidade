import 'package:filmes_lancamento/Network/api.dart';
import 'package:filmes_lancamento/Models/app_model.dart';
import 'package:filmes_lancamento/movies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Model', () {
    test('is not null?', () {
      //PREP
      final model = AppModel(api: MockAPI());
      //METHOD
      model.fetchMovies(1);
      //EXPECTED
      expect(model.movies, completion(isNotNull));
    });
  });
}
//api: MockAPI()

class MockAPI extends API {
  Map<String, dynamic> map = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
    'page': '',
  };

  @override
  Future<Movies> fetchMovies() {
    final movies = Movies([Movie('Filme 1')]);
    return Future.value(movies);
  }
}
