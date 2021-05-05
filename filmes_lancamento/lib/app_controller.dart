import 'package:filmes_lancamento/app_model.dart';
import 'package:filmes_lancamento/movies.dart';

class AppController {
  final model = AppModel();

  Future<Movies> get movies => model.movies;

  loadMovies(int page) {
    model.fetchMovies(page);
  }
}
