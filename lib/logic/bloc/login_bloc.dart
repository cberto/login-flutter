import 'dart:async';

import 'package:panificadora_mimago/logic/bloc/validators.dart'; 
import 'package:rxdart/rxdart.dart';


class LoginBloc  with Validators {
  LoginBloc() : super();

final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
 final BehaviorSubject<String> _passController = BehaviorSubject<String>();
final BehaviorSubject<int> _numClienteController =  BehaviorSubject<int>();
 final BehaviorSubject<int> _cuitController = BehaviorSubject<int>();
final BehaviorSubject<int> _telefonoController = BehaviorSubject<int>();



  //Recuperar los datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passStream =>
      _passController.stream.transform(validarPass);
  Stream<int> get numStream =>
      _numClienteController.stream.transform(validarNumeroCliente);
  Stream<int> get cuitStream =>
      _cuitController.stream.transform(validarCUIT);
  Stream<int> get telefonoStream =>
      _telefonoController.stream.transform(validarTelefono);


  //Validar formulario
  Stream<bool> get singupFormValidation => 
    Rx.combineLatest5(emailStream, passStream, numStream, cuitStream, telefonoStream, (String e, String p, int n, int c, int t) => true);
  
  
  //obetener la data  de los streams
  String get email => _emailController.value;
  String get password => _passController.value;
  int get numCliente => _numClienteController.value;
  int get cuit => _cuitController.value;
  int get telefono => _telefonoController.value;

  //Insertar valores al stream

  //Insertar valores al stream
 Function(String) get changeEmail => _emailController.sink.add;
 Function(String) get changePass => _passController.sink.add;
 Function(int) get changeNumCliente => _numClienteController.sink.add;
 Function(int) get changeCuit => _cuitController.sink.add;
Function(int) get changeTelefono => _telefonoController.sink.add;



  void dispose() {
    _emailController?.close();
    _passController?.close();
    _numClienteController?.close();
    _cuitController?.close();
    _telefonoController?.close();
  }

}










