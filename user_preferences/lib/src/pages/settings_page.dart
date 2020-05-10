import 'package:flutter/material.dart';
import 'package:user_preferences/src/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Paco';
  TextEditingController _textCtrl;

  @override
  void initState() {
    super.initState();
    _textCtrl = new TextEditingController(text: _nombre);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppbar(),
      body: _renderBody(),
      drawer: DrawerWidget(),
    );
  }

  Widget _renderAppbar() {
    return AppBar(
      title: Text('Ajustes'),
    );
  } 

 Widget _renderBody() {
   return ListView(
      children: <Widget>[
          Container (
      padding: EdgeInsets.all(5.0),
      child: Text('Settings: ', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
       
     ),
     Divider(),
     SwitchListTile(
       value: _colorSecundario,
       title: Text('Color secundario: '),
       onChanged: (value){
         setState(() {
           _colorSecundario = value;
         });
       },
     ),
     Divider(),
     RadioListTile(
       value: 1,
       title: Text('Masculino'),
       groupValue: _genero,
       onChanged: (value){
         setState(() {
           _genero = value;
         });
       },
     ),
     RadioListTile(
       value: 2,
       title: Text('Femenino'),
       groupValue: _genero,
       onChanged: (value){
         setState(() {
           _genero = value; 
         });
       },
     ),
     Divider(),
     Container(
       padding: EdgeInsets.all(10),
       child: TextField(
         controller: _textCtrl,
         decoration: InputDecoration (
           labelText: 'Nombre',
           helperText: 'Nombre de la persona que usara el telefono'
         ),
         onChanged: (value){

         },
       )
     )
    ],
   );
 }
}