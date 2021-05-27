import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/movies.dart';

class AppModel {
  Future<Movies> _movies;
  API api = API(map: {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
    'page': '',
  });
  Future<Movies> get movies => _movies;

  AppModel({this.api});

  fetchMovies(int page) {
    api.map['page'] = '$page';
    _movies = api.fetchMovies();
  }
}
