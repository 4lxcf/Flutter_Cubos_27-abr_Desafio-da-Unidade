import 'package:filmes_lancamento/app_controller.dart';
import 'package:filmes_lancamento/movies.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  AppView({Key key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final controller = AppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: SafeArea(
              minimum: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: TextButton(
                child: Text(
                  'Lançamentos',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                onPressed: controller.loadMovies(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: FutureBuilder<Movies>(
                future: controller.movies,
                builder: (_, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.movieList.length,
                      itemBuilder: (ctx, index) {
                        return Row(
                          children: [
                            Container(
                              height: 210,
                              width: 140,
                              margin: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w300${snapshot.data.movieList[index].posterPath}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  width: 220,
                                  margin: EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    '${snapshot.data.movieList[index].originalTitle} ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 220,
                                  margin: EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    '( ${snapshot.data.movieList[index].title} )',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 225,
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    '${snapshot.data.movieList[index].overview}',
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      //letterSpacing: 0.7,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_rounded,
                                      size: 16,
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.only(left: 8.0),
                                    //   child: Text(
                                    //     'Release Date:',
                                    //     style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        snapshot
                                            .data.movieList[index].releaseDate
                                            .split('-')
                                            .reversed
                                            .reduce((value, element) =>
                                                value + '-' + element)
                                            .toString(),
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 55,
                                  width: 225,
                                  margin: EdgeInsets.only(top: 15.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (ctx, index) {
                                      return Container(
                                        height: 60,
                                        width: 40,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        decoration: BoxDecoration(
                                          color: Colors.yellowAccent,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
