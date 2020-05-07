import 'package:flutter/material.dart';
import 'package:movies_flutter/src/models/actores_model.dart';
import 'package:movies_flutter/src/models/pelicula_model.dart';
import 'package:movies_flutter/src/providers/peliculas_provider.dart';

class MovieDetail extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _makeAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate (
              [
                SizedBox(height: 10.0,),
                _posterTitulo(pelicula, context),
                SizedBox(height: 20.0,),
                _description(pelicula),
                _description(pelicula),
                _description(pelicula),
                _description(pelicula),
                _renderActors(pelicula, context)
              ]
            ),
          )
        ],
      )
    );
  }

  Widget _makeAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        )
      ),
      
    );
  }

  Widget _posterTitulo(Pelicula pelicula, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: Row(children: <Widget>[
        Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,
            ),
          ),
        ),
        SizedBox(width: 20.0,),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text(
              pelicula.title,
              style: Theme.of(context).textTheme.title,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              pelicula.originalTitle,
               style: Theme.of(context).textTheme.subhead,
               overflow: TextOverflow.ellipsis,
            ),
            Row(children: <Widget>[
              Icon(Icons.star_border),
              Text(
                pelicula.voteAverage.toString(),
                style: Theme.of(context).textTheme.title
                
                )
            ],)
          ],)
        )
      ],),
    );
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
        )

    );
  }

  Widget _renderActors(Pelicula pelicula, BuildContext context) {
    final movieId = pelicula.id.toString();
    return FutureBuilder(
      future: peliculasProvider.getCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        return snapshot.hasData ? _makeActorsPageView(snapshot.data)
                : Container(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator()
                    )
         
            );
          });
  }
        
  Widget _makeActorsPageView(List<Actor> actors) {
    return SizedBox(
      height: 200.0,
        child: PageView.builder(
          pageSnapping: false,
          itemCount: actors.length,
          controller: PageController(
            viewportFraction: 0.3,
            initialPage: 1,
          ),
        itemBuilder: (context, i){
         return _actorCard(actors[i]);
        }
      ),
    );
  }

  Widget _actorCard(Actor actor) {
    return Container(child:Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
          image: NetworkImage(actor.getProfileImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          height: 150.0,
          fit: BoxFit.cover
        ),
      ),
      Text(
        actor.name,
        overflow: TextOverflow.ellipsis,
        )
    ],));
  }
}