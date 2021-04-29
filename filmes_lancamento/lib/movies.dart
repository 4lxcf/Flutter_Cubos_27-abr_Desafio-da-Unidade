class Movies {
  List<String> moviesTitle = [];
  List<String> moviesPosterPath = [];
  List<String> moviesOverview = [];
  List<String> moviesReleaseDate = [];
  int actualPage;
  int totalPages;

  Movies.fromJson(Map<String, dynamic> json) {
    actualPage = json['page'];
    totalPages = json['total_pages'];
    var titlesList = json['results'] as List;

    titlesList.forEach(
      (element) => moviesTitle.add(element['original_title'].toString()),
    );
    titlesList.forEach(
      (element) => moviesPosterPath.add(element['poster_path'].toString()),
    );
    titlesList.forEach(
      (element) => moviesOverview.add(element['overview'].toString()),
    );
    titlesList.forEach(
      (element) => moviesReleaseDate.add(element['release_date'].toString()),
    );
  }
}
//List<Infos> results;
// results = titlesList.map((item) {
//   return Infos.fromJson(item['results']);
// }).toList();

// class Infos {
//   String originalTitle;
//   String posterPath;
//   String backdropPath;
//   String overview;
//   DateTime releaseDate;
//   bool adult;

//   Infos.fromJson(Map<String, dynamic> json) {
//     originalTitle = json['original_title'];
//     posterPath = json['poster_path'];
//     backdropPath = json['backdrop_path'];
//     overview = json['overview'];
//     releaseDate = json['release_date'];
//     adult = json['adult'];
//   }
// }
