import 'package:filmes_lancamento/app_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Model is not null?', () {
    //PREP
    final model = AppModel();
    //METHOD
    model.fetchMovies(1);
    //EXPECTED
    expect(model.movies, isNotNull);
  });
}
