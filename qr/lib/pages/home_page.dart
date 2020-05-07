
import 'package:flutter/material.dart';
import 'package:qr/models/scan_model.dart';
import 'package:qr/pages/directions_page.dart';
import 'package:qr/pages/maps_page.dart';
import 'package:qr/providers/db_provider.dart';

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
    dynamic futureString = 'https://frenando-herrera.com';

    try {
      // futureString = await BarcodeScanner.scan();
      if(futureString != null) {
        final scan = ScanModel(valor: futureString);
        DbProvider.db.newScan(scan);
      }
    } catch(e) {
      futureString = e.toString();
    }
  }
}