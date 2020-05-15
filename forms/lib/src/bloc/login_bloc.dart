
import 'dart:async';

import 'package:forms/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailCtrl = BehaviorSubject<String>();
  final _passwordCtrl = BehaviorSubject<String>();

  // Insertar valores al stream
  Function(String) get changeEmail => _emailCtrl.sink.add;
  Function(String) get changePass => _passwordCtrl.sink.add;

  //listeng
  Stream<String> get emailStream => _emailCtrl.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordCtrl.stream.transform(validarPassword);
  Stream<bool> get formValidStream => Rx.combineLatest2(emailStream, passwordStream, (email,pass) => true);


  // ultimo valor ingresado a los streams

  String get email => _emailCtrl.value;
  String get password => _passwordCtrl.value;
  
  dispose() {
    _emailCtrl?.close();
    _passwordCtrl?.close();
  }
}