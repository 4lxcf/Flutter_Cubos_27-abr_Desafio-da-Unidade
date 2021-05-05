import 'dart:convert';
import 'package:filmes_lancamento/movies.dart';
import 'package:http/http.dart' as http;

class API {
  String _authority = 'api.themoviedb.org';
  String _path = '/3/movie/upcoming';

  Map<String, dynamic> _queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
  };

  Future<Movies> fetchMovies() async {
    final response = await http.get(Uri.https(
      _authority,
      _path,
      _queryParameters,
    ));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error(response.statusCode);
    }
  }
}
