import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _page1(),
          _page2()
      ],)
    );
  }

  Widget _page1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _texts()

      ]
    );
  }
  Widget _page2() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _button()
      ],
    );
  }
  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0)
    );
  }

  Widget _imagenFondo() {
    return Container (
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/original.png')
      )
    );
  }

  Widget _texts() {

    final textStyle = TextStyle(color: Colors.white, fontSize: 56);
    return SafeArea(
          child: Column(children: <Widget>[
          Text('11',style: textStyle),
          Text('Miercoles', style: textStyle),
          Expanded(child: Container(),),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
      ],),
    );
  }

  Widget _button() {
    return SafeArea(
      child: Center(
        child: RaisedButton(
          onPressed: (){},
          color: Colors.blue,
          shape: StadiumBorder(),
          child: Text('Comenzar', style: TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          padding: const EdgeInsets.all(20),
        )
        ,) ,
    );
  }
}