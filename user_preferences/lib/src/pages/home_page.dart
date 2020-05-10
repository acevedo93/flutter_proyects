import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppbar(),
      body: _renderBody(),
      drawer: DrawerWidget()
    );
  }

  Widget _renderAppbar() {
    return AppBar(
      title: Text('Preferencias de Usuario'),
    );
  }

 Widget _renderBody() {
   return Column (
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Text('Color secundario: '),
       Divider(),
       Text('Genero: '),
       Divider(),
       Text('Nombre de usuario:'),
       Divider()
     ],
   );
 }
}