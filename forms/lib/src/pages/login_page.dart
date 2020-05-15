

import 'package:flutter/material.dart';
import 'package:forms/src/bloc/login_bloc.dart';
import 'package:forms/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _makeBackground(context),
          _makeLoginForm(context)
        ],
      )
    );
  }

  Widget _makeBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final purpleBackground =  Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ]
        )
      )
    );

    final circulo = Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)
        )
    );

    return Stack(children: <Widget>[
      purpleBackground,
      Positioned(
        top: 90.0,
        left: 30.0,
        child: circulo,
      ),
      Positioned(
        top: 20.0,
        right: -20.0,
        child: circulo,
      ),
      Positioned(
        bottom: 12.0,
        right: -20.0,
        child: circulo,
      ),

      Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget> [
            Icon( Icons.person_pin, color: Colors.white, size: 100.0 ),
            SizedBox(height: 10.0, width: double.infinity),
            Text('Forms Bloc', style: TextStyle(color: Colors.white, fontSize: 25.0))
          ]
        )
      )


    ],);
  }

  Widget _makeLoginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SafeArea(
          child: Container(height: 180,) ,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 12.0),
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset:  Offset(0.0, 5.0),
                spreadRadius: 3.0
              )
            ]
          ),
          child: Column (
            children: <Widget> [
              Text('Ingreso', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 60.0),
              _makeEmail(bloc),
               SizedBox(height: 30.0),
              _makePassword(bloc),
              SizedBox(height: 30.0),
              _makeButton(bloc)
            ]
          )
        ),
        Text('Recuperar Contraseña'),
        SizedBox(height: 100.0)

      ],
    ),
    );
  }

  Widget _makeEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.alternate_email, color: Colors.deepPurple),
              labelText: 'Correo eletronico',
              errorText: snapshot.error  ,
            ) ,
            onChanged: bloc.changeEmail,
          )
        );
      }
    );
  }

  Widget _makePassword(LoginBloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              icon: Icon( Icons.lock, color: Colors.deepPurple),
              labelText: 'password',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePass,
          )
        );
      }
    );
  }

  Widget _makeButton(LoginBloc bloc) {


   return StreamBuilder<Object>(
     stream: bloc.formValidStream,
     builder: (context, snapshot) {
       return RaisedButton (
         color: Colors.deepPurple,
         textColor: Colors.white,
         onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
         child: Container(
           child: Text('Ingresar'),
         )
       );
     }
   );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('email: ${bloc.email}');
    print('Pass: ${bloc.password}');
    Navigator.pushReplacementNamed(context, 'home');
  }
}