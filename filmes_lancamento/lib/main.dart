import 'package:filmes_lancamento/CommonViews/app_view.dart';
import 'package:filmes_lancamento/Utils/routes.dart';
import 'package:flutter/material.dart';

import 'DetailMovie/film_details_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.APP_HOME_VIEW,
      routes: {
        Routes.APP_HOME_VIEW: (ctx) => AppView(),
        Routes.FILMDETAILS_VIEW: (ctx) => FilmDetailsView(),
      },
    );
  }
}
