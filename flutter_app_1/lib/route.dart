import "package:flutter/material.dart";
import "package:flutter_app_1/assestsEx.dart";
import "package:flutter_app_1/loginForm.dart";

class RouteGenerator{

  static const String homePage='/';
  static const String secondPage= '/assets';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case homePage: return MaterialPageRoute(builder: (_)=>const  LoginForm() ); 
      case secondPage: return MaterialPageRoute(builder: (_)=>const  Assets() ); 
      default:
          throw const FormatException("Route not found");
    }
  }
}

