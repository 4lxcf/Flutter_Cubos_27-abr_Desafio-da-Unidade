import 'package:filmes_lancamento/Models/app_view_model.dart';
import 'package:filmes_lancamento/Widgets/film_widget.dart';
import 'package:filmes_lancamento/movies.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  AppView({Key key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final controller = AppViewModel();
  int indexPage = 1;
  int totalPage = 20;

  @override
  void initState() {
    super.initState();
    controller.loadMovies(indexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: SafeArea(
                minimum: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recents',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue[50],
                alignment: Alignment.center,
                width: double.infinity,
                child: StreamBuilder<Movies>(
                  stream: controller.streamController.stream,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.movieList.length,
                        itemBuilder: (ctx, index) {
                          if (index < snapshot.data.movieList.length - 5) {
                            indexPage++;
                            controller.loadMovies(indexPage);
                          }
                          return FilmWidget(
                              filmOriginalTitle:
                                  '${snapshot.data.movieList[index].originalTitle} ',
                              filmOverview:
                                  '${snapshot.data.movieList[index].overview}',
                              filmPopularity:
                                  snapshot.data.movieList[index].popularity,
                              filmPoster:
                                  'https://image.tmdb.org/t/p/w300${snapshot.data.movieList[index].posterPath}',
                              filmReleaseDate: snapshot
                                  .data.movieList[index].releaseDate
                                  .split('-')
                                  .reversed
                                  .reduce(
                                      (value, element) => value + '-' + element)
                                  .toString(),
                              filmTitle:
                                  '( ${snapshot.data.movieList[index].title} )',
                              filmVoteAverage:
                                  '${snapshot.data.movieList[index].voteAverage}');
                        },
                      );
                    } else {
                      return Container(
                        child: Text(
                          'ERROR ${snapshot.error}. Your API Key isn\'t working.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
