import "dart:async";
import "dart:ui";
import 'package:connectivity_plus/connectivity_plus.dart';
import "package:flutter/material.dart";

class Connecivity extends StatefulWidget {
  const Connecivity({super.key});
  @override
  State<Connecivity> createState() => _createConnectivityState();
}

class _createConnectivityState extends State<Connecivity> {
  @override
  void initState() {
    super.initState();
    StreamSubscription subscription =
        Connectivity().onConnectivityChanged.listen(_showSnackBar);
  }

  

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(title: Text("Connectivity")),
          body: Center(
        child: Image(image: AssetImage('assets/images/geometric.jpg')),
      ))  
    ;
  }
  _showSnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final color = hasInternet ? Colors.green : Colors.red;
    final text =
        hasInternet ? Text("Connected to internet") : Text("No Internet");
      print("inside snackbar");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: text,
        backgroundColor: color,
      ),
    );
  
  }
}

void main() {
  runApp(const MaterialApp(home:Connecivity()));
}
