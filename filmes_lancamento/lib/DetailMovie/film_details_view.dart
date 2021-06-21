import 'package:filmes_lancamento/Models/app_view_model.dart';
import 'package:filmes_lancamento/Widgets/film_widget.dart';
import 'package:flutter/material.dart';

class FilmDetailsView extends StatefulWidget {
  @override
  _FilmDetailsViewState createState() => _FilmDetailsViewState();
}

class _FilmDetailsViewState extends State<FilmDetailsView> {
  final controller = AppViewModel();

  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context).settings.arguments as FilmWidget;
    var doubleVoteAverage = double.parse(film.filmVoteAverage);
    assert(doubleVoteAverage is double);
    controller.isFavorite(film.filmId);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          StreamBuilder(
            stream: controller.streamControllerFav.stream,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return IconButton(
                  iconSize: 30,
                  icon: snapshot.data
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border),
                  onPressed: () {
                    setState(() {
                      snapshot.data
                          ? controller.removeFavoriteMovie(film.filmId)
                          : controller.addFavoriteMovie(film.filmId);
                    });
                  },
                );
              } else {
                return IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {},
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(film.filmBackdrop),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white30.withOpacity(1),
                      Colors.white30.withOpacity(0.2),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 1.0,
              ),
              child: Text(
                film.filmOriginalTitle,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 1.0,
              ),
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 16,
                      color: (index < (doubleVoteAverage / 2).floor())
                          ? Colors.yellowAccent
                          : Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Text(
                      film.filmVoteAverage,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              child: Text(
                'Release Date: ${film.filmReleaseDate}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10.0,
                top: 40.0,
                bottom: 10.0,
              ),
              child: Text(
                'OVERVIEW',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                film.filmOverview,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
