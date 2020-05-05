import 'package:flutter/material.dart';


class Counter extends StatefulWidget {
  @override
  State createState() => _CounterState();
}




// Estado de la clase 
class _CounterState extends State<Counter> {
  final _textStyle = new TextStyle(fontSize: 25);
  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TOP
      appBar: AppBar(
        title: Text('Statefull'),
        centerTitle: true,
      ),
      // BODY
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de tab:', style:TextStyle(fontSize: 30)),
            Text('$_conteo',
            style: _textStyle
            )
          ],
        )
      ),
      
      floatingActionButton: renderButtons()
    );
  }

  Widget renderButtons() {
    var row = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(width:30),
            button((){ _conteo++;}, Icons.add),
            Expanded(child:SizedBox()),
            button((){ _conteo--;}, Icons.remove ),
            SizedBox(width: 5.0,),
            button((){ _conteo = _conteo * 2;}, Icons.cancel ),
            SizedBox(width: 5.0,),
            button((){ _conteo = _conteo * 10;}, Icons.add_alarm ),
    
        ],);
        return row;
  }
  // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  Widget button(func, IconData icon) {
    var floatingActionButton = FloatingActionButton(
          child: Icon(icon),
          onPressed: ()=>setState(()=>func())
        );
        return floatingActionButton;
  }
}