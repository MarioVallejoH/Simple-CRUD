import 'dart:io';

import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/providers/data_provider.dart';

Future<Map<dynamic, dynamic>> singup() async {
  
  DataProvider provider = new DataProvider();
  
  final authData = {
    "name": bloc.nameSingup,
    "email": bloc.email,
    "password": bloc.password,
    "rol": "USER_ROLE"
  };
  // print(authData);


  final resp = await provider.postPetition(USER,  authData,
                headers: {
                  HttpHeaders.contentTypeHeader: 'application/json'
                });

  Map<String, dynamic> decodedResp = resp; //Sin conexión
  if (decodedResp['status'] == 1) {

    // print(bloc.records.records[0].firstlastname);
    return {
      'status': true
    };
  } else if (decodedResp['status'] == 2) {
    return {
      'status': false,
      'msg': decodedResp['msg']['errors'][0]['msg']
    };
  } else {
    return {
      'status': false,
      'msg': decodedResp['msg'],
    };
  }
}