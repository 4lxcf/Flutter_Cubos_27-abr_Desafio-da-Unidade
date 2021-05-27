import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/app_model.dart';
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

class MockAPI extends API {
  @override
  Future<Movies> fetchMovies() {
    final movies = Movies([Movie('Filme 1')]);
    return Future.value(movies);
  }
}
