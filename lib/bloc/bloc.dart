


import 'package:flutter_auth/bloc/validator.dart';
import 'package:flutter_auth/models/records.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators{

  // to save data of forms
  // login and singup
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameSingupController = BehaviorSubject<String>();

  // create record
  final _nameController = BehaviorSubject<String>();
  final _name2Controller = BehaviorSubject<String>();
  final _lastnameController  = BehaviorSubject<String>();
  final _lastname2Controller = BehaviorSubject<String>();
  final _documentTypeController = BehaviorSubject<String>();
  final _documentController = BehaviorSubject<String>();
  final _eventController = BehaviorSubject<String>();
  

  // to save user data
  final _userFetcher = BehaviorSubject<User>();
  // to save records data
  final _recordsFetcher = BehaviorSubject<Records>();


  // GETTERS
  // login and singup form data
  get emailStream => _emailController.stream
      .transform(validarEmail); 
  get passwordStream => _passwordController.stream
      .transform(validarPassword); 
  get nameSingupStream => _nameSingupController.stream
      .transform(validarName); 

  // record form data
  get nameStream => _nameController.stream;
  get name2Stream => _name2Controller.stream;
  get lastnameStream => _lastnameController.stream;
  get lastname2Stream => _lastname2Controller.stream;
  get documentTypeStream => _documentTypeController.stream;
  get documentStream => _documentController.stream;
  get eventStream => _eventController.stream;

  // global data
  Stream<User> get userStream => _userFetcher.stream;

  Stream<Records> get recordsStream => _recordsFetcher.stream;

  // Stream<Map> get form => _formFetcher.stream;

  // SETTERS
  //login and singup form
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeNameSingup => _nameSingupController.sink.add;

  // record form
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeName2 => _name2Controller.sink.add;
  Function(String) get changeLastName => _lastnameController.sink.add;
  Function(String) get changeLastName2 => _lastname2Controller.sink.add;
  Function(String) get changeDocType => _documentTypeController.sink.add;
  Function(String) get changeDoc => _documentController.sink.add;
  Function(String) get changeEvent => _eventController.sink.add;


  //global data
  loadUser(User user) {
    _userFetcher.sink.add(user);
  }

  loadRecords(Records records) {
    _recordsFetcher.sink.add(records);
  }



  // get last modified values

  //global data
  User get user => _userFetcher.value;
  Records get records => _recordsFetcher.value;

  //login and singup
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get nameSingup => _nameSingupController.value;

  //record form
  String get name => _nameController.value;
  String get name2 => _name2Controller.value;
  String get lastName => _lastnameController.value;
  String get lastName2 => _lastname2Controller.value;
  String get docType => _documentTypeController.value;
  String get doc => _documentController.value;
  String get event => _eventController.value;




  
  

  dispose() {
    _userFetcher.close();
    _recordsFetcher.close();
    _nameController.close();
    _name2Controller.close();
    _lastnameController.close();
    _lastname2Controller.close();
    _documentTypeController.close();
    _documentController.close();
    _eventController.close();
    _nameSingupController.close();
  }
}

final bloc = Bloc();