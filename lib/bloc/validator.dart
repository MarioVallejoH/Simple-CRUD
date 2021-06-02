import 'dart:async';

class Validators{

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ){

      sink.add(email);
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);
      if ( regExp.hasMatch(email)){
        sink.add(email);
      } else {
        sink.addError('Invalid Email');
      }
     }
  );


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ){
      if ( password.length >= 6 ){
        sink.add ( password );
      } else {
        sink.addError('Password must contain at least 6 characters');
      }
    }
  );
  final validarName = StreamTransformer<String, String>.fromHandlers(
    handleData: ( name, sink ){
      if ( name.length > 6 ){
        sink.add ( name );
      } else {
        sink.addError('Must provide a name');
      }
    }
  );



}