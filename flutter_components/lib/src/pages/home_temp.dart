import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {


  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Componentes Temp') ,
        ),
        body: ListView(
          children: _addListShortWay()
        )
      );
  }


  List<Widget> _addList() {

    List<Widget> lista = new List<Widget>();
    for(var item in opciones) {
      final tempWidget = ListTile(
        title: Text(item));
        lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _addListShortWay() {

   var widgets = opciones.map(( item ) {
     return Column(
       children: <Widget>[
         ListTile(
           subtitle: Text('Soy un subtitulo'),
           title: Text(item),
           leading: Icon(Icons.account_balance),
           trailing: Icon(Icons.keyboard_arrow_right),
           onTap: (){},
         ),
         Divider()
       ],
     );
   }).toList();

   return widgets;
  }
}