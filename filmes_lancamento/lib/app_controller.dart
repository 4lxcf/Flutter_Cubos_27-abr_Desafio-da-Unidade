import 'dart:async';

import 'package:filmes_lancamento/app_model.dart';
import 'package:filmes_lancamento/movies.dart';

class AppController {
  final _model = AppModel();

  Future<Movies> get movies => _model.movies;

  loadMovies(int page) {
    _model.fetchMovies(page);
  }
}
