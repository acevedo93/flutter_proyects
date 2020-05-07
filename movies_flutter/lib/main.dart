import 'package:flutter/material.dart';
import 'package:movies_flutter/src/pages/home_page.dart';
import 'package:movies_flutter/src/pages/movie_detail.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detail': (BuildContext context) => MovieDetail()

      }
    );
  }
}