import 'package:barcode_scan/gen/protos/protos.pb.dart';
import 'package:flutter/material.dart';
import 'package:qr/pages/directions_page.dart';
import 'package:qr/pages/maps_page.dart';

import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _makeAppBar(),
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigation(),
      floatingActionButton: __makeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        ),
      ] ,
    );
  }

  Widget _callPage(int actualPage) {
    switch(actualPage) {
      case 0: return MapsPage();
      case 1: return DirectionsPage();
      default: return MapsPage();
    }
  }

  Widget __makeButton() {
    return FloatingActionButton(
      onPressed: _scanQr,
      child: Icon(Icons.filter_center_focus),
    );
  }

  Widget _makeAppBar() {
    return AppBar(
      title: Text('Qr scanner'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: (){},
          color: Theme.of(context).primaryColor
        )
      ],
    );
  }

  void _scanQr() async {
    // https://frenando-herrera.com
    // geo:40.453452345,-73.5345667
    print('hola');
    dynamic futureString = '';

    try {
      futureString = await BarcodeScanner.scan();
      if(futureString != null) {
        print(futureString);
      }
    } catch(e) {
      futureString = e.toString();
    }
  }
}