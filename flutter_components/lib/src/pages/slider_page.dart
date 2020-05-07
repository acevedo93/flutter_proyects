import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _value = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider')
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _makeSLider(),
            Divider(),
            _makeImage(),
            Divider(),
            _makeCheckBox(),
            Divider(),
            _makeSwitch()
          ],
        ),
      ),
    );
  }

  Widget _makeSLider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'tamaño de la imagen',
      value:  _value,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck) ? null : (value ){
        setState(() {
          _value = value;
        });
      }
    );
  }

  Widget _makeImage() {
    return Image(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Luis_Alberto_Spinetta_en_1976.jpg/245px-Luis_Alberto_Spinetta_en_1976.jpg'),
      width: _value,
      fit: BoxFit.cover
    );

  }

  Widget _makeCheckBox() {

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
   Widget _makeSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}