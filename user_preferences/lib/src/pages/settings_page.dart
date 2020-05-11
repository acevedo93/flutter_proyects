import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    _loadPrefs();
    _textCtrl = new TextEditingController(text: _nombre);
  }
  _loadPrefs () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _genero = prefs.getInt('genero'); 
    });
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
       onChanged: _setSelectedRadio
     ),
     RadioListTile(
       value: 2,
       title: Text('Femenino'),
       groupValue: _genero,
       onChanged: _setSelectedRadio,
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

  _setSelectedRadio(int valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genero', valor);
    setState(() {
      _genero = valor;
    });
  }
}