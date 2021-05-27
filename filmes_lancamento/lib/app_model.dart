import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/movies.dart';

class AppModel {
  Future<Movies> _movies;
  API api;
  Future<Movies> get movies => _movies;

  AppModel({this.api});

  fetchMovies(int page) {
    api.map['page'] = '$page';
    _movies = api.fetchMovies();
  }
}
