import 'package:flutter/material.dart';

class FilmWidget extends StatelessWidget {
  final String filmPoster;
  final String filmOriginalTitle;
  final String filmTitle;
  final String filmOverview;
  final String filmReleaseDate;
  final String filmVoteAverage;
  final double filmPopularity;

  FilmWidget(
    this.filmOriginalTitle,
    this.filmOverview,
    this.filmPopularity,
    this.filmPoster,
    this.filmReleaseDate,
    this.filmTitle,
    this.filmVoteAverage,
  );

  @override
  Widget build(BuildContext context) {
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
            filmPoster,
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
              margin: EdgeInsets.only(bottom: 2.0),
              child: Text(
                filmOriginalTitle,
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
                filmTitle,
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
                filmOverview,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          filmReleaseDate
                              .split('-')
                              .reversed
                              .reduce((value, element) => value + '-' + element)
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          filmVoteAverage,
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          '${(filmPopularity / 1000).toStringAsFixed(1)}K',
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
  }
}
