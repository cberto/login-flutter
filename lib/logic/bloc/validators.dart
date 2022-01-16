
import 'dart:async';

class Validators{
  final StreamTransformer<String, String> validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      const String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final RegExp regExp = RegExp(pattern);
      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Formato incorrecto');
      }
    }
  );

  final validarPass = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password,EventSink<String> sink){

      if(password.length >= 8 ){
        sink.add(password);
      }else{
        sink.addError('La contraseña debe tener al menos 8 caracteres');
      }
    }
  );
  
  final validarNumeroCliente = StreamTransformer<int, int>.fromHandlers(
    handleData: (int numCliente,EventSink<int> sink){

     const String pattern = r'^(?:[+0][1-9])?[0-9]{8,12}$';
     final RegExp regExp = RegExp(pattern);
      if (numCliente == 0) {
      sink.add(numCliente);
    } else if (numCliente > 0 && regExp.hasMatch(numCliente.toString()))
    {
      sink.add(numCliente);
    } else {
      sink.addError('Numero cliente solo permite numeros');
    }
    }
  );

    final validarCUIT = StreamTransformer<int, int>.fromHandlers(
    handleData: (int cuit,EventSink<int> sink){

      const String pattern = r'^(?:[+0][1-9])?[0-9]{8,12}$';
     final RegExp regExp = RegExp(pattern);
    if (cuit == 0) {
      sink.add(cuit);
    } else if (cuit > 0 && regExp.hasMatch(cuit.toString())) {
      sink.add(cuit);
    } else {
      sink.addError('Cuit solo permite numeros');
    }
  });
final validarTelefono = StreamTransformer<int, int>.fromHandlers(
   handleData: (int telefono,EventSink<int> sink){
//  const String patttern = r'(^[0-9]*$)';
//  final RegExp regExp =  RegExp(patttern);
 if (telefono== 0) {
   return "El telefono es necesario";
 } else if (telefono!= 10) {
   sink.addError("El numero debe tener 10 digitos");
 }
 return null;
}
);
}