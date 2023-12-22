import "package:flutter/material.dart";
import "package:connectivity_plus/connectivity_plus.dart";
class Products extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Future<bool> isConnected = checkConnection()  ;
    if (isConnected==ConnectivityResult.none){
      return Scaffold(
        appBar: AppBar(title: const Text('Products'),),
        body:
      const SnackBar(content: Text('Plese connect to the internet')));
    }
    return Scaffold( appBar: AppBar(title: const Text('Products'),),
                  // body: GridView(),
            );
  }

  Future<bool> checkConnection() async {
    
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result==ConnectivityResult.none){
      return false;
    }
    return true;
  }
}