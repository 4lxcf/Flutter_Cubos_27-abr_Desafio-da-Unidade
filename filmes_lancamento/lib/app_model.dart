import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/movies.dart';

class AppModel {
  Future<Movies> _movies;

  Future<Movies> get movies => _movies;

  Map<String, dynamic> _queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
    'page': '',
  };

  fetchMovies(int page) {
    _queryParameters['page'] = '$page';
    _movies = API(_queryParameters).fetchMovies();
  }
}
