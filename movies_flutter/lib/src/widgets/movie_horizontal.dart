import 'package:flutter/material.dart';
import 'package:movies_flutter/src/models/pelicula_model.dart';

class MovieHorizontalWidget extends StatelessWidget {

  final List<Pelicula> movies;

  Function nextPage;

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );
  MovieHorizontalWidget({@required this.movies, @required this.nextPage});
  
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent -200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: true,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, i) {
          return _tarjeta(context, movies[i]);
        }
      )
    );
  }

  Widget _tarjeta (BuildContext context, Pelicula movie) {
    movie.uniqueId = '${movie.id}-footer';
    final peliculaTarjeta = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
              image: NetworkImage(movie.getPosterImg()),
              placeholder: AssetImage('assets/img/loading.gif'),
              fit: BoxFit.cover,
              height: 130.0,
              ),
            ),
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
            )
        ],),
        );
    return GestureDetector(
      child: peliculaTarjeta,
      onTap: (){
        Navigator.pushNamed(context, 'detail', arguments:movie);
      },
    );
  }

  // List<Widget> _tarjetas(BuildContext context) {
  //   return movies.map((movie){
  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(children: <Widget>[
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(20.0),
  //           child: FadeInImage(
  //           image: NetworkImage(movie.getPosterImg()),
  //           placeholder: AssetImage('assets/img/loading.gif'),
  //           fit: BoxFit.cover,
  //           height: 130.0,
  //           ),
  //         ),
  //         Text(
  //           movie.title,
  //           overflow: TextOverflow.ellipsis,
  //           style: Theme.of(context).textTheme.caption,
  //           )
  //       ],),
  //       );
  //   }).toList();
  // }
}