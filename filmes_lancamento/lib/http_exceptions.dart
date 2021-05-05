class HttpExceptions {
  String key;
  static const Map<String, dynamic> map = {
    'GET https://api.themoviedb.org/3/movie/upcoming?api_key':
        'Your API Key isn\'t working. Please contact TheMovieDB support team.',
  };

  HttpExceptions(this.key);

  String errorMessage() {
    if (map.containsKey(key)) {
      return map[key];
    } else {
      return 'Unknown Error.';
    }
  }
}
