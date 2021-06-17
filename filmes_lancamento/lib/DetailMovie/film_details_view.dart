import 'package:filmes_lancamento/Widgets/film_widget.dart';
import 'package:flutter/material.dart';

class FilmDetailsView extends StatefulWidget {
  @override
  _FilmDetailsViewState createState() => _FilmDetailsViewState();
}

class _FilmDetailsViewState extends State<FilmDetailsView> {
  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context).settings.arguments as FilmWidget;

    return Scaffold(
      appBar: AppBar(
        title: Text(film.filmTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              child: Image.network(film.filmPoster),
            ),
            Text(
              film.filmOriginalTitle,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Text(
                film.filmOverview,
                style: TextStyle(
                  fontSize: 24,
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
