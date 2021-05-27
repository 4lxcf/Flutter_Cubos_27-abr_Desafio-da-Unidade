class Movies {
  List<Movie> movieList;
  int actualPage;
  int totalPages;

  Movies.fromJson(Map<String, dynamic> json) {
    actualPage = json['page'];
    totalPages = json['total_pages'];
    var resultList = json['results'] as List;

    movieList = resultList.map((item) {
      return Movie.fromJson(item);
    }).toList();
  }

  Movies(this.movieList);
}

class Movie {
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  double popularity;
  double voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    popularity = json['popularity'];
    voteAverage = json['vote_average'].toDouble();
  }

  Movie(this.title);
}
