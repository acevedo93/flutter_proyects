import 'package:flutter/material.dart';
import 'package:qr/models/scan_model.dart';
 // token pk.eyJ1IjoiZGFqY2V2ZWRvIiwiYSI6ImNrOXlsYWZzNjB3MWEzZHBieWJ1ZmpjbmEifQ.j1xzYdB-O7-otkZEzhsDNg
class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Coordenadas QR'),
          actions: <Widget>[
            IconButton (
              icon: Icon(Icons.my_location),
              onPressed: (){},
            )
          ],
        ),
        body: Center(child: Text('${scan.valor}'),)
    );
  }
}