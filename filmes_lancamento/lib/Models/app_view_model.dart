import 'dart:async';

import 'package:filmes_lancamento/Network/api.dart';
import 'package:filmes_lancamento/Models/app_model.dart';
import 'package:filmes_lancamento/movies.dart';

class AppViewModel {
  final _model = AppModel(
    api: API(
      map: {
        'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
        'page': '',
      },
    ),
  );
  Future<bool> get isFavorite => _model.isFavorite();
  Future<Movies> get movies => _model.movies;
  int get id => _model.id;

  StreamController<Movies> streamController = StreamController();

  loadMovies(int page) {
    _model.fetchMovies(page);
    _model.movies.then((value) => streamController.add(value));
  }

  void addFavoriteMovie(int id) {
    _model.id = id;
    _model.addFavoriteMovie();
  }

  void removeFavoriteMovie(int id) {
    _model.id = id;
    _model.removeFavoriteMovie();
  }
}
