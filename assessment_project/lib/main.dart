import 'dart:io';

import 'package:assessment_project/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState()=>_createMyAppState();
}

class _createMyAppState extends State<MyApp>{
   bool isConnected = false;
  
   @override
   void initState()  { 
    super.initState();
    checkConnection();

  }

  void checkConnection() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  if (result != ConnectivityResult.none) {
    setState((){
      isConnected=true;
    });}
    else{
    setState((){
      isConnected=false;
    });
    }
  }
  
   @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: isConnected == true
          ? RouteGenerator.loginForm
          : RouteGenerator.noInternet,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class NoConnection extends StatefulWidget {
  const NoConnection({super.key});

  @override
  State<NoConnection> createState()=>_createNoConnectionState();
}

class _createNoConnectionState extends State<NoConnection>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Image(image: AssetImage('assets/images/connection_error.png')),
        TextButton(
            onPressed: (){
              setState(() {
                // sConnec
              });
            },
            child: Text("Refresh"))
      ],
    )));
  }
}

