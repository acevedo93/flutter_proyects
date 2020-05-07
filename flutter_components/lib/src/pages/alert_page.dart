import 'package:flutter/material.dart';



class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        title: Text('Alert page')
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.purpleAccent,
          onPressed: () => _showAlert(context),
          shape: StadiumBorder(),
          )
        )
    );
  }

  void _showAlert(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            Text('Este es el contenido de la alerta'),
            Container(
              padding: EdgeInsets.all(12) ,
              child: FlutterLogo(size:100.0) ,)
          ],),
          actions: <Widget>[
            FlatButton(child: Text('Cancel'), onPressed: () => Navigator.of(context).pop()),
            FlatButton(child: Text('Aceptar'), onPressed: () => Navigator.of(context).pop())
          ],
        );
      }
    );
  }
} 