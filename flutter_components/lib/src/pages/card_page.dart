import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: renderCards()
          ),
      );
  }

  Widget cardTipo1() {
    return Card(
      // clipBehavior: Clip.antiAlias,  

      elevation: 3 ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(children: <Widget>[
        ListTile(
          title:Text('Soy el titulo de esta tarjeta'),
          subtitle: Text('Descripcion para la carpeta que se quiere mostrar'),
          leading: Icon(
            Icons.photo_album,
            color: Colors.purpleAccent
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end ,
            children: <Widget>[ FlatButton(
        child: Text('Aceptar'),
        onPressed: (){},
      ),
      FlatButton(
        child: Text('cancelar'),
        onPressed: (){},
      )
    ])
      ],)
    );
  }
  Widget cardTipo2() {
    final card = Container(
      color:Colors.white,
      child: Column(
        children: <Widget>[
          FadeInImage(
           image: NetworkImage("https://picsum.photos/id/237/1200/900"),
           placeholder:AssetImage('assets/original.gif'),
           fadeInDuration: Duration(milliseconds: 200),
           height: 300,
           fit: BoxFit.cover
          ),
          Container(
            child: Text('Una descripcion para poner aca'),
            padding: EdgeInsets.all(12),
          )
        ],
      ),
     
    );

  return Container(
      child: ClipRRect(child: card, borderRadius: BorderRadius.circular(30.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
        )
    );
  }

  List<Widget> renderCards() {
    var list = <Widget>[];
    list..add( cardTipo1())..add(SizedBox(height: 30.0));
    for(var i in [1,2,3,4,5,6]) {
      list..add(cardTipo2())..add(SizedBox(height: 30.0));
    }
    return list;
  }
}