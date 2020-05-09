
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:qr/models/scan_model.dart';
 // token pk.eyJ1IjoiZGFqY2V2ZWRvIiwiYSI6ImNrMjM2c3hvejBsdzUzYm94cTcxNDU3OHYifQ.6YRlLDSJO2pHGvkrWRmV8QNg
class MapPage extends StatelessWidget {

  final mapCtrl = new MapController();
  final token = "pk.eyJ1IjoiZGFqY2V2ZWRvIiwiYSI6ImNrMjM2c3hvejBsdzUzYm94cTcxNDU3OHYifQ.6YRlLDSJO2pHGvkrWRmV8Q";
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
        body: _createFlutterMap(scan),
        floatingActionButton: _makeActionButton(context),
    );
  }

  Widget _createFlutterMap(ScanModel scan) {
    return  FlutterMap(
      mapController: mapCtrl,
      options: MapOptions (
        center: scan.getLatLtn(),
        zoom: 15.0
      ),
      layers: [
        _renderMap(),
        _renderTargets(scan)
      ]
    );
  }

  _renderMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': token,
        'id': 'mapbox.mapbox-streets-v7'
      }
    );
  }

  _renderTargets(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLtn(),
          builder: (BuildContext context) => Container(
            child: Icon(
              Icons.location_on,
              size:70.0,
              color: Theme.of(context).primaryColor
              ),
            )
        )
      ]
    );
  }

  Widget _makeActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}