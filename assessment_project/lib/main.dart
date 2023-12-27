import 'dart:async';
import 'dart:io';

import 'package:assessment_project/LoginForm.dart';
import 'package:assessment_project/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteGenerator.loginForm,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _createMyAppState();
}

class _createMyAppState extends State<MyApp> {
  bool connectedBefore = true;
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(connectionUpdate);

    // checkConnection();
  }

  void connectionUpdate(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    print(hasInternet);
    print("inside connectionUpdate");
    if (result != ConnectivityResult.none) {
      print("hasInternet${hasInternet}");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MaterialApp(home: LoginForm())),
          ModalRoute.withName(RouteGenerator.loginForm));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => NoConnection()));
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(title: Text("MYAPP")),
    );
  }
}

class NoConnection extends StatefulWidget {
  const NoConnection({super.key});

  @override
  State<NoConnection> createState() => _createNoConnectionState();
}

class _createNoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Image(image: AssetImage('assets/images/connection_error.png')),
        TextButton(
            onPressed: () {
              setState(() {
                // sConnec
              });
            },
            child: Text("Refresh"))
      ],
    )));
  }
}
