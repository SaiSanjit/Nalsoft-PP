import "dart:ui";
import 'package:connectivity_plus/connectivity_plus.dart';
import "package:flutter/material.dart";

class Connecivity extends StatefulWidget {
  const Connecivity({super.key});
  @override
  State<Connecivity> createState() =>_createConnectivityState();
}

class _createConnectivityState extends State<Connecivity> {
  bool isConnected=false;
  
   @override
   void initState()  { 
    super.initState();
    checkConnection();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result==ConnectivityResult.none){
        setState(() {
          isConnected=false;
        });
      }
      else{
        setState(() {
          isConnected=true;
        });
      }
  });

  }  
  void checkConnection() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  if (result != ConnectivityResult.none) {
    setState((){
      isConnected=true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connection Restored")));
    });}
    else{
    setState((){
      isConnected=false;
    });
    }
  }
@override
Widget build(BuildContext context){
  return  MaterialApp(
    home: Scaffold(
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:[ (isConnected==true)? const Text("Connected"):const Text("not connected"),
        TextButton(onPressed: checkConnection, child: Text((isConnected==false)?"Refresh":"")),
      ]),),
      
      ),
    );
  
}
}
void main() {
  runApp(const Connecivity());
}
