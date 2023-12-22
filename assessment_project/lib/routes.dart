import "package:assessment_project/LoginForm.dart";
import "package:assessment_project/chits.dart";
import "package:assessment_project/main.dart";
import "package:assessment_project/products.dart";
import "package:flutter/material.dart";

class RouteGenerator{
  static const String loginForm="/" ;
  static const String chits="/chits" ;
  static const String products="/products" ;
  static const String noInternet="/noConnection" ;
  // static final
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case loginForm :return MaterialPageRoute(builder: (_)=>const LoginForm());
      case chits: return MaterialPageRoute(builder: (_)=> Chits());
      case products: return MaterialPageRoute(builder: (_)=> Products());
      case noInternet: return MaterialPageRoute(builder: (_)=> noConnection());
      default: throw const FormatException("Route not found");
    }
  }
}