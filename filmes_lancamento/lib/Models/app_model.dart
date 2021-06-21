import 'package:filmes_lancamento/Network/api.dart';
import 'package:filmes_lancamento/Storage/internal_storage.dart';
import 'package:filmes_lancamento/Storage/shared_preferences_adapter.dart';
import 'package:filmes_lancamento/movies.dart';

class AppModel {
  Future<Movies> _movies;
  API api;
  Future<Movies> get movies => _movies;
  int id;
  final InternalStorageAdapter internalStorage = SharedPreferencesAdapter();

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

  void addFavoriteMovie() {
    internalStorage.addFavoriteMovie(id);
  }

  void removeFavoriteMovie() {
    internalStorage.removeFavoriteMovie(id);
  }

  Future<bool> isFavorite() async {
    return internalStorage.isFavorite(id);
  }
}
