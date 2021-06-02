


import 'dart:io';

import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/records.dart';
import 'package:flutter_auth/providers/data_provider.dart';

Future<Map<dynamic, dynamic>> postRecord() async {
  
  DataProvider provider = new DataProvider();
  
  final authData = {
    "firstname": bloc.name,
    "secondname": bloc.name2,
    "firstlastname": bloc.lastName,
    "secndlastname": bloc.lastName2,
    "documentType": bloc.docType,
    "document": bloc.doc,
    "eventType": bloc.event
  };
  // print(authData);


  final resp = await provider.postPetition(GETRECORDS,  authData,
                headers: {
                  HttpHeaders.contentTypeHeader: 'application/json',
                  'x-token':bloc.user.token
                });

  Map<String, dynamic> decodedResp = resp; //Sin conexión
  if (decodedResp['status'] == 1) {
    await getRecords();
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


Future<Map<dynamic, dynamic>> getRecords() async {
  
   DataProvider provider = new DataProvider();
  

  final resp = await provider.getPetition(GETRECORDS,  
                headers: {
                  // HttpHeaders.contentTypeHeader: 'application/json',
                  'x-token':bloc.user.token
                });

  Map<String, dynamic> decodedResp = resp; //Sin conexión
  if (decodedResp['status'] == 1) {
    Records records = new Records.fromJson(decodedResp['body']);
    bloc.loadRecords(records);
    // print(bloc.records.records[0].firstlastname);
    return {
      'status': true
    };
  } else if (decodedResp['status'] == 2) {
    return {
      'status': false,
      'msg': decodedResp['msg']
    };
  } else {
    return {
      'status': false,
      'msg': decodedResp['msg'],
    };
  }
}

Future<Map<dynamic, dynamic>> deleteRecord(String id) async {
  
   DataProvider provider = new DataProvider();
  String endpoint = GETRECORDS + '/' + id;

  final resp = await provider.deletePetition(
                endpoint,  
                headers: {
                  // HttpHeaders.contentTypeHeader: 'application/json',
                  'x-token':bloc.user.token
                });

  Map<String, dynamic> decodedResp = resp; //Sin conexión
  if (decodedResp['status'] == 1) {
    await getRecords();
    // print(bloc.records.records[0].firstlastname);
    return {
      'status': true
    };
  } else if (decodedResp['status'] == 2) {
    return {
      'status': false,
      'msg': decodedResp['msg']
    };
  } else {
    return {
      'status': false,
      'msg': decodedResp['msg'],
    };
  }
}