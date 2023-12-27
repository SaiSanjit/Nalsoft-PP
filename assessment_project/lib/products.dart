import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),

        
        body: FutureBuilder(
            future: generateProducts(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return snapShot.data as Widget;
              }
            }));
  }

  Future<Widget> generateProducts() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var products = jsonDecode(response.body) as List;
      print("products");

      print(products.length);
      products.forEach((item) => print(item["id"]));
      
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            print("builder");
            return ProductCard(
                products[index]["title"], products[index]["image"]);
          });
    } else{
      return const Text("No Products");}
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
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Products()));
}
