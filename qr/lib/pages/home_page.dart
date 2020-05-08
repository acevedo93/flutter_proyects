


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr/bloc/scans_bloc.dart';
import 'package:qr/models/scan_model.dart';
import 'package:qr/pages/directions_page.dart';
import 'package:qr/pages/maps_page.dart';
import 'package:qr/utils/utils.dart' as utils;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();

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
          onPressed: (){
            scansBloc.deleteAll();
          },
          color: Colors.white
        )
      ],
    );
  }

  void _scanQr() async {
    // https://frenando-herrera.com
    // geo:40.453452345,-73.5345667
    dynamic futureString = 'https://fernando-herrera.com';
    dynamic geoString = 'geo:40.453452345,-73.5345667';
    try {
      // futureString = await BarcodeScanner.scan();
      if(futureString != null) {
        final scan = ScanModel(valor: futureString);
        scansBloc.newScan(scan);
        final scan2 = ScanModel(valor: geoString);
        scansBloc.newScan(scan2);
        if (Platform.isIOS ) {
          return Future.delayed(Duration(milliseconds: 750), ()=> utils.launchScan(scan,context));
        }
        return utils.launchScan(scan, context);
      }
    } catch(e) {
      futureString = e.toString();
    }
  }
}