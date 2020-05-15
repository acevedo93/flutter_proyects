
import 'package:flutter/material.dart';
import 'package:forms/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     final bloc  = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(children: <Widget>[
          Text('Email: ${bloc.email} '),
          Divider(),
          Divider(),
          Text('Pass: ${bloc.password} ')
        ],)
    );
  }
}