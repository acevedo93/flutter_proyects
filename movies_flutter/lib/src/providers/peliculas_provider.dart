import 'dart:async';
import 'dart:convert';

import 'package:movies_flutter/src/models/actores_model.dart';
import 'package:movies_flutter/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
class PeliculasProvider {
  // uaHo4XxBPsrcKm3L1UWXpue76
// 2eef05c086fcf6d9c34d52f54f47812d
  String _apikey = '2eef05c086fcf6d9c34d52f54f47812d';
  String _url = 'api.themoviedb.org';
  String _language = 'es';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populars = new List();

  final _popularesStreamCtrl = StreamController<List<Pelicula>>.broadcast();


  void disposeStreams () {
    _popularesStreamCtrl?.close();
  }

  Function(List<Pelicula>) get popularesSink => _popularesStreamCtrl.sink.add;

  Stream <List<Pelicula>> get popularesStream => _popularesStreamCtrl.stream;


  Future<List<Pelicula>> getOnTheaters() async {
  final url = Uri.https(_url,'3/movie/now_playing',{
    'api_key': _apikey,
    'language': _language
  });
  return _sendResponse(url);
 }

 Future<List<Pelicula>> getPopulars() async {
   if(_cargando) return [];
   _cargando = true;
   _popularesPage++;
   final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
   });
   final resp = await _sendResponse(url);
   _populars.addAll(resp);
   _cargando = false;
   popularesSink(_populars);

  }

  Future<List<Pelicula>> _sendResponse(Uri url) async{
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }


  Future <List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key': _apikey,
      'language': _language,
   });
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final actores = new Actors.fromJsonList(decodedData['cast']);
    return actores.items;
  }

  Future<List<Pelicula>> searchMovie(String query) async {
    final url = Uri.https(_url, '3/search/movie/', {
      'api_key': _apikey,
      'language': _language,
      'query': query
   });

   final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final actores = new Peliculas.fromJsonList(decodedData['results']);
    return actores.items;
  }
}