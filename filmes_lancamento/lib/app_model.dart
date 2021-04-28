import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/movies.dart';

class AppModel {
  Future<Movies> _movies;

  Future<Movies> get movies => _movies;

  fetchMovies() {
    _movies = API().fetchMovies();
  }
}
