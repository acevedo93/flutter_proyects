
import 'package:flutter/material.dart';
import 'package:movies_flutter/src/providers/peliculas_provider.dart';
import 'package:movies_flutter/src/search/search_delegate.dart';
import 'package:movies_flutter/src/widgets/card_swiper_widget.dart';
import 'package:movies_flutter/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulars();
    return Scaffold(
      appBar: AppBar(
        title: Text('ChibCHombia'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },)
        ],

      ),
     body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           _renderSwiper(),
           _renderFooter(context)
         ],
       )
       ,)
    );
  }

  Widget _renderSwiper() {

    return FutureBuilder(
      future: peliculasProvider.getOnTheaters(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot)
      { 
        return snapshot.hasData ? CardSwiperWidget(movies: snapshot.data)
        : Container(
          height: 400,
          child: Center(
            child: CircularProgressIndicator()
            )
          );
        
      }
    );

    // peliculasProvider.getOnTheaters();
    // return CardSwiperWidget(movies: [1,2,3,4,5]);
  }

  Widget _renderFooter(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Container(
             padding: EdgeInsets.only(left: 20.0),
             child: Text('Populares', style: Theme.of(context).textTheme.subhead),
           ),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              return snapshot.hasData ? MovieHorizontalWidget(
                movies: snapshot.data,
                nextPage: peliculasProvider.getPopulars)
              : Center(child: CircularProgressIndicator());
            },),
        ],
      ),
    );
  }
}