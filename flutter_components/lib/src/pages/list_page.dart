import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 1;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    _addImages();

    _scrollController.addListener(() {
     if (_scrollController.position.pixels  == _scrollController.position.maxScrollExtent) {
      _fetchData();
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas'),),
      body: Stack(children: <Widget>[
        _makeList(),
        _makeLoading()    
      ],)
    );
  }


  Widget _makeList() {
    return RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final image = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?images=$image'),
            placeholder: AssetImage('assets/original.gif'),
            );
        },
      ),
    );
  }


  void _addImages() {
    for ( var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState((){
    });
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    Duration duration = new Duration(milliseconds: 2000);
    return new Timer(duration, httpResponse);
  }
    
  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200)
    );
    _addImages();
  }

  Widget _makeLoading() {
    if(_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),

            ],
          ),
          SizedBox(height: 15.0),
        ],
        
      );
     
    }
    return Container();
  }

  Future<Null> refresh() async {
    Duration duration = new Duration( seconds: 2);

    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _addImages();
    });

    return Future.delayed(duration);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

}