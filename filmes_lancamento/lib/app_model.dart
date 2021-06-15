import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/movies.dart';

class AppModel {
  Future<Movies> _movies;
  API api;
  Future<Movies> get movies => _movies;

  AppModel({this.api});

  fetchMovies(int page) async {
    api.map['page'] = '$page';
    _movies = updateMovies();
  }

  Future<Movies> updateMovies() async {
    var currentMovies = await _movies ?? Movies([]);
    var newMovies = await api.fetchMovies();

    newMovies.movieList.forEach((element) {
      currentMovies.movieList.add(element);
    });

    return currentMovies;
  }
}
