
import 'package:flutter/material.dart';
import 'package:mess_management/providers/downloadProvider.dart';
import 'package:mess_management/providers/login_provider.dart';
import 'package:mess_management/screens/login_page.dart';
import 'package:mess_management/screens/route_management.dart';
import 'package:mess_management/screens/user_home_page_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel()),
      ChangeNotifierProvider<HomePageModel>(create: (context) => HomePageModel()),
      ChangeNotifierProvider<DownloadProvider>(create: (context) => DownloadProvider()),
    ],
    child: SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteManagement.generateRoute,
        home: UserLoginPage()
      ),
    ),
  )
);

