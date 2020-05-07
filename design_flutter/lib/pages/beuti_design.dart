import 'dart:math';

import 'package:flutter/material.dart';

class BeutiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _newBottonNavitgationBar(context),
      body: Stack(
        children: <Widget>[
          _backgroundApp(),
          _content(),
        ],
      )
    );
  }

  Widget _backgroundApp() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0,0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      )
    );

    final boxPink = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
      height: 340.0,
      width: 360.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.0),
       gradient: LinearGradient(
         colors: [
           Color.fromRGBO(236, 98, 188, 1.0),
           Color.fromRGBO(241, 142, 172, 1.0)
         ]
       )
      )
    ),
    );

    return Stack(children: <Widget>[
      gradient,
      Positioned (
        top: -100.0,
        left: -50,
        child: boxPink 
      )
    ],);
  }

  Widget _content() {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        _titles(),
        _buttons()
      ],),
    );
  }

  Widget _titles() {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text('Hijueputa Covid19', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Welcome to your app.', style: TextStyle(color: Colors.white, fontSize: 30.0))
          ],
      ),),
    );
  }

  Widget _bottonNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.calendar_today)
        ),
         BottomNavigationBarItem(
           title: Container(),
          icon: Icon(Icons.calendar_today)
        ),
         BottomNavigationBarItem(
           title: Container(),
          icon: Icon(Icons.calendar_today)
        ),
      ]
    );
  }
  Widget _newBottonNavitgationBar(BuildContext context) {
    return (
      Theme (
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon( Icons.calendar_today, size: 30.0),
              title: Container()
            ),
             BottomNavigationBarItem(
              icon: Icon( Icons.bubble_chart, size: 30.0),
              title: Container()
            ),
             BottomNavigationBarItem(
              icon: Icon( Icons.supervised_user_circle, size: 30.0),
              title: Container()
            ),
          ] ,
        )
      )
    );
  }

  Widget _buttons() {
    return Table (
      children: [
        TableRow (
          children: [
            _makeButton(),
             _makeButton()
          ]
        ),
        TableRow (
          children: [
             _makeButton(),
             _makeButton()
          ]
        ),
         TableRow (
          children: [
             _makeButton(),
             _makeButton()
          ]
        ),
      ],
    );
  }

  Widget _makeButton() {
    return Container (
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.swap_calls, color: Colors.white, size: 30.5,),
            radius: 35.0
          ),
          Text('Item1', style: TextStyle(color: Colors.white)),
          SizedBox(height: 5.0,)
        ],
      ),
    );
  }
}