class Movies {
  List<String> moviesTitle = [];
  int actualPage;
  int totalPages;

  Movies.fromJson(Map<String, dynamic> json) {
    actualPage = json['page'];
    totalPages = json['total_pages'];
    var titlesList = json['results'] as List;

    titlesList.forEach(
        (element) => moviesTitle.add(element['original_title'].toString()));
  }
}
