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
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: TextButton(
                        child: Text(
                          'Coming Soon',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            controller.loadMovies(indexPage);
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Row(
                        children: [
                          indexPage > 1
                              ? IconButton(
                                  icon: Icon(
                                    Icons.chevron_left_rounded,
                                    size: 14,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      indexPage--;
                                      controller.loadMovies(indexPage);
                                    });
                                  },
                                )
                              : Container(),
                          Text('$indexPage'),
                          (indexPage < totalPage)
                              ? IconButton(
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    size: 14,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      indexPage++;
                                      controller.loadMovies(indexPage);
                                    });
                                  },
                                )
                              : Container(width: 20),
                        ],
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
                child: FutureBuilder<Movies>(
                  future: controller.movies,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.movieList.length,
                        itemBuilder: (ctx, index) {
                          snapshot.data.totalPages != null
                              ? totalPage = snapshot.data.totalPages
                              : '';
                          return Row(
                            children: [
                              Container(
                                height: 210,
                                width: 140,
                                margin: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.4),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8.0,
                                      spreadRadius: 5.0,
                                      offset: Offset(0, 2),
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ],
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w300${snapshot.data.movieList[index].posterPath}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 220,
                                    margin: EdgeInsets.only(bottom: 2.0),
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
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      '( ${snapshot.data.movieList[index].title} )',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 225,
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    child: Text(
                                      '${snapshot.data.movieList[index].overview}',
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.calendar_today_rounded,
                                              size: 16,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                snapshot.data.movieList[index]
                                                    .releaseDate
                                                    .split('-')
                                                    .reversed
                                                    .reduce((value, element) =>
                                                        value + '-' + element)
                                                    .toString(),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 60,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Vote Average',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${snapshot.data.movieList[index].voteAverage}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Fame Rating',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${(snapshot.data.movieList[index].popularity / 1000).toStringAsFixed(1)}K',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
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
