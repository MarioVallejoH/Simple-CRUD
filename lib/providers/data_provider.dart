import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class DataProvider {
  // POST petitons
  Future<Map<String,dynamic>> postPetition
        (String endpoint, Map authData, {Map<String, String> headers}) async {
    var resp;
    String body = jsonEncode(authData);
    String url = URL + '/api/$endpoint';
    try {
      resp = await http.post(
        url, 
        body: body, 
        headers: headers
      ).timeout(
        Duration(seconds: 15),
        onTimeout: (){
          throw TimeoutException('Now answer, try again.');
        }
      );
      
      if (resp.statusCode == 200) {

        return {'status': 1 , 'body':json.decode(resp.body)};
      } else {
        // print(resp.statusCode);
        return {'status': 2, 'msg': json.decode(resp.body), 'body': null};
      }
    }
    

    on SocketException {
      return {'status': 1, 'msg': 'Verify your internet connection', 'body': null};
        // controlador = 'sinConexion';
    } on http.ClientException {
      // print('ClientException');
      return {'status': 2, 'msg': 'Something went wrong, try again', 'body': null};
    } on TimeoutException {
      return {'status': 3, 'msg': 'No answer, try again', 'body': null};
    }
    
    catch (e) {
      return {'status': 0, 'msg': 'Failed request', 'body': null};
    }
  } 
  // GET
  Future<Map<String,dynamic>> getPetition
        (String endpoint,{Map<String, String> headers}) async {
    var resp;
    String _url = URL + '/api/$endpoint';
    try {
      resp = await http.get(
        _url, 
        headers: headers
      ).timeout(
        Duration(seconds: 15),
        onTimeout: (){
          throw TimeoutException('Now answer, try again.');
        }
      );
      
      if (resp.statusCode == 200) {
        return {
          'body':json.decode(resp.body),
          'status':1
        };
      }else if(resp.statusCode == 401){ 
        return {
          'status': 2,
          'msg': json.decode(resp.body)['msg']
        };
      }else {
        // print(resp.statusCode);
        return {'status': 3, 'msg': 'Something went wrong, try again!', 'body': null};
      }
    }
    

    on SocketException {
      return {'status': 1, 'msg': 'Verify your internet connection', 'body': null};
        // controlador = 'sinConexion';
    } on http.ClientException {
      // print('ClientException');
      return {'status': 2, 'msg': 'Something went wrong, try again', 'body': null};
    } on TimeoutException {
      return {'status': 3, 'msg': 'No answer, try again', 'body': null};
    }
    
    catch (e) {
      return {'status': 0, 'msg': 'Failed request', 'body': null};
    }
  }

  // DELETE

  Future<Map<String,dynamic>> deletePetition
        (String endpoint,{Map<String, String> headers}) async {
    var resp;
    String _url = URL + '/api/$endpoint';
    try {
      resp = await http.delete(
        _url, 
        headers: headers
      ).timeout(
        Duration(seconds: 15),
        onTimeout: (){
          throw TimeoutException('Now answer, try again.');
        }
      );
      
      if (resp.statusCode == 200) {
        return {
          'body':json.decode(resp.body),
          'status':1
        };
      }else if(resp.statusCode == 401){ 
        return {
          'status': 2,
          'msg': json.decode(resp.body)['msg']
        };
      }else {
        // print(resp.statusCode);
        return {'status': 3, 'msg': 'Something went wrong, try again!', 'body': null};
      }
    }
    

    on SocketException {
      return {'status': 1, 'msg': 'Verify your internet connection', 'body': null};
        // controlador = 'sinConexion';
    } on http.ClientException {
      // print('ClientException');
      return {'status': 2, 'msg': 'Something went wrong, try again', 'body': null};
    } on TimeoutException {
      return {'status': 3, 'msg': 'No answer, try again', 'body': null};
    }
    
    catch (e) {
      return {'status': 0, 'msg': 'Failed request', 'body': null};
    }
  }
}