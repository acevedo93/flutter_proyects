import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_flutter/src/models/pelicula_model.dart';


class CardSwiperWidget extends StatelessWidget {


  final List<Pelicula> movies;
  CardSwiperWidget({ @required this.movies });



  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          movies[index].uniqueId = '${movies[index].id}-swiper';
          return GestureDetector(
            child: Hero(
              tag: movies[index].uniqueId,
              child: ClipRRect(
              child: FadeInImage(
                image: NetworkImage(movies[index].getPosterImg()),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover
                ),
              borderRadius: BorderRadius.circular(20.0)
              ),
              
          ),
          onTap: (){
            Navigator.pushNamed(context, 'detail', arguments: movies[index]);
          });
        },
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}