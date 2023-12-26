import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

// import "package:connectivity_plus/connectivity_plus.dart";
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future<bool> isConnected = checkConnection()  ;
    // if (isConnected==ConnectivityResult.none){
    //   return Scaffold(
    //     appBar: AppBar(title: const Text('Products'),),
    //     body:
    //   const SnackBar(content: Text('Plese connect to the internet')));
    // }
    // generateProducts();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: FutureBuilder(
            future: generateProducts(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapShot.hasError) {
        return Text('Error: ${snapShot.error}');
      } else {
        return snapShot.data as Widget;
      }
            })
            );
  }
Future<Widget> generateProducts() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    var response = await http.get(url);
    print( jsonDecode(response.body));
    var products = jsonDecode(response.body) as List;
    print("products");
    print(products.length);
    products.forEach((item)=>print(item["id"]));
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
            itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          print("builder");
          // print(products[1);
          return ProductCard(products[index]["title"], products[index]["image"]);
        });
  }
}

class ProductCard extends StatelessWidget {
  final name;
  final imageUrl;

  ProductCard(this.name, this.imageUrl);
  
  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Card(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 100,
            // width: 50,
          ),
          Text(name,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}

void main(){
  runApp(Products());
}