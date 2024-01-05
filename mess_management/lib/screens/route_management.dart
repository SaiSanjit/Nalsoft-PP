import 'package:flutter/material.dart';
import 'package:mess_management/screens/adminHomePage.dart';
import 'package:mess_management/screens/digital_sign_page.dart';
import 'package:mess_management/screens/download.dart';
import 'package:mess_management/screens/employeeLunchStatus.dart';
import 'package:mess_management/screens/employees.dart';
import 'package:mess_management/screens/login_page.dart';
import 'package:mess_management/screens/preview_page.dart';
import 'package:mess_management/screens/userRegistration.dart';
import 'package:mess_management/screens/user_home_page.dart';

class RouteManagement {
  RouteManagement._();
  static const String homePage = '/homepage';
  static const String employees = '/employees';
  static const String employeeLunchStatus = '/employeeLunchStatus';
  static const String download = '/download';
  static const String adminHomePage = '/adminHomePage';
  static const String userRegistration = '/userRegistration';

  
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => UserLoginPage());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => UserHomePage());
      case '/sign':
        return MaterialPageRoute(builder: (_) => SignPage());
      case '/preview':
        return MaterialPageRoute(builder: (_) => Preview());
      case '/userRegistration':
        return MaterialPageRoute(builder: (_) => UserRegistrationView());
      case '/adminHomePage':
        return MaterialPageRoute(builder: (_) => AdminHomePage());
      case '/employees':
        return MaterialPageRoute(builder: (_) => Employees());
      case '/download':
        return MaterialPageRoute(builder: (_) => Download());
      case '/employeeLunchStatus':
        return MaterialPageRoute(builder: (_) => EmployeeLunchStatus());
        
      case '/adminHomePage':
        return MaterialPageRoute(builder: (_) => AdminHomePage());
      default:
        return null;
    }
  }
}
