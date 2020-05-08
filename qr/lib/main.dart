import 'package:flutter/material.dart';
import 'package:qr/pages/home_page.dart';
import 'package:qr/pages/mapas_pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'qr scanner',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapPage()
      },
      theme: ThemeData(
        primaryColor: Colors.deepOrange
      ),
    );
  }
}