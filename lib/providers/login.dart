

// import 'package:flutter/material.dart';
// import 'package:flutter_auth/bloc/bloc.dart';
import 'dart:io';

import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:flutter_auth/providers/data_provider.dart';



Future<Map<dynamic, dynamic>> login() async {
  
   DataProvider provider = new DataProvider();
  
  

  // bloc;

  final authData = {
    'email': bloc.email,
    'password': bloc.password
  };
  final resp = await provider.postPetition(LOGIN, authData, headers: {HttpHeaders.contentTypeHeader: 'application/json',});

  Map<String, dynamic> decodedResp = resp; //Sin conexión
  if (decodedResp['status'] == 1) {
    User user = new User.fromJson(decodedResp['body']);
    bloc.loadUser(user);
    return {
      'status': true
    };
  } else if (decodedResp['status'] == 204) {
    return {
      'status': false,
      'msg': 'User or password incorrect, try again.',
    };
  } else {
    return {
      'status': false,
      'msg': decodedResp['body']['msg'],
    };
  }
}