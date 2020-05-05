import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {


  String _nombre = ' ';
  String _email = ' ';
  String _fecha = ' ';
  List _list = ['Volar', 'Rayos x', 'Super man' ];
  var _dropdownValue =  'Super man';

  TextEditingController _inputFieldDateController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de textos ')  
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _makeInput(),
          Divider(),
          _makeEmail(),
          Divider(),
          _makePassword(),
          Divider(),
          _makeDate(context),
          Divider(),
          _makePerson(),
          Divider(),
          _crearDropDown(),
          Divider(),
        ],
      ) ,
    );
  }

  Widget _makeInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.insert_photo),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){
        setState(() {
          _nombre = value;
        });
      },
    );
  }
  Widget _makeEmail() {
   return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
        counter: Text('Letras ${_email.length}'),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Ingrese su email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },
    );
 }
  Widget _makePassword() {
   return TextField(
     obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Password',
        labelText: 'Contraseña',
        helperText: 'Ingrese su contraseña',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock_outline)
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },
    );
}
  Widget _makePerson() {
   return ListTile(
     title: Text('El nombre es : $_nombre'),
     subtitle:  Text('Email es : $_email'),
   );
 }

  Widget _makeDate( BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        helperText: 'Ingrese su Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_view_day)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      }
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES')
      );

      if (picked != null) {
        setState((){
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
        });
      }
  }

  List<DropdownMenuItem<String>> getOPtionsMenuItems() {
    List<DropdownMenuItem<String>> lista = new List();
    _list.forEach((item){
      lista.add(DropdownMenuItem(
        value: item,
        child: Text(item)
        ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return DropdownButton(
      value: _dropdownValue,
      icon: Icon(Icons.arrow_right),
      items: getOPtionsMenuItems(),
      onChanged: (dynamic value){
        setState(() {
         _dropdownValue = value; 
        });
      },

    );
  }
  
}