import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateRecord/createRecord_screen.dart';
import 'package:flutter_auth/Screens/Records/records_screen.dart';
import 'package:flutter_auth/Screens/home/home_screen.dart';


import 'Screens/Login/login_screen.dart';
import 'Screens/Signup/signup_screen.dart';

class Routes {

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      'login'       : (BuildContext context) => LoginScreen(),
      'singup'      : (BuildContext context) => SignUpScreen(),
      'home'        : (BuildContext context) => HomePage(),
      'records'     : (BuildContext context) => RecordsScreen(),
      'createRecord': (BuildContext context) => CreateRecord(),
      
    };
  }
}