import 'dart:convert';
import 'package:filmes_lancamento/movies.dart';
import 'package:http/http.dart' as http;

class API {
  String _authority = 'api.themoviedb.org';
  String _path = '/3/movie/upcoming';
  Map<String, dynamic> map;

  API(this.map);

  Future<Movies> fetchMovies() async {
    final response = await http.get(Uri.https(
      _authority,
      _path,
      map,
    ));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error(response.statusCode);
    }
  }
}
