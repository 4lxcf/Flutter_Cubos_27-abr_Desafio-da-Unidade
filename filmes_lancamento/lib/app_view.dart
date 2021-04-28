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
              color: Colors.blueAccent,
              child: FutureBuilder<Movies>(
                future: controller.movies,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.moviesTitle.length,
                      itemBuilder: (ctx, index) {
                        return Text('${snapshot.data.moviesTitle[index]}');
                      },
                    );
                  } else {
                    return null;
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
