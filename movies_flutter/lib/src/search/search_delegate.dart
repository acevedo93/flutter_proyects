import 'package:flutter/material.dart';
import 'package:movies_flutter/src/models/pelicula_model.dart';
import 'package:movies_flutter/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  
  String seleccion = '';
  final peliculas = [
    'el principito',
    'la momia',
    'chespirito',
    'spiderman',
    'capitan america'
  ];
  final moviesProvider = new PeliculasProvider();

  final peliculasRecientes = [
    'spiderman',
    'capitan america'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          print('Click!!');
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // genera los resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias para las busquedas
    if(query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if(snapshot.hasData) {
            final pelis = snapshot.data;
            return ListView(
              children: pelis.map((pelicula){
                pelicula.uniqueId = '${pelicula.id}-search';
                return ListTile(
                  leading: Hero(
                    tag: pelicula.uniqueId,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/img/loading.gif'),
                      image: NetworkImage(pelicula.getPosterImg()),
                      fit: BoxFit.contain,
                      width: 50.0,
                      ),
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: (){
                    close(context, null);
                    Navigator.pushNamed(context, 'detail', arguments: pelicula);
                  },
                );
              }).toList()
            );
          } 
          return Center(child: CircularProgressIndicator());
        }

      );

  //   final listaSugestion = (query.isEmpty) 
  //     ? peliculasRecientes
  //     : peliculas.where((p) => p.toLowerCase().startsWith(query.toLowerCase())
  //   ).toList();
  //   return ListView.builder(
  //     itemCount: listaSugestion.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugestion[i]),
  //         onTap:(){
  //           seleccion = listaSugestion[i];
  //           showResults(context);
  //         }
  //       );
  //     }
  //   );
  // }
  
  }
  
}