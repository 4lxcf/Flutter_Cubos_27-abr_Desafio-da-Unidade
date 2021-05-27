import 'dart:async';

import 'package:filmes_lancamento/api.dart';
import 'package:filmes_lancamento/app_model.dart';
import 'package:filmes_lancamento/movies.dart';

class AppController {
  final _model = AppModel(
    api: API(
      map: {
        'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
        'page': '',
      },
    ),
  );

  Future<Movies> get movies => _model.movies;

  loadMovies(int page) {
    _model.fetchMovies(page);
  }
}
