import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transform Widget Example',
      home: TransformExample(),
    );
  }
}

class TransformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Educative Scaling Answet')),
      body: Column(
        children: [
          Flexible(
            // fit: FlexFit.loose,
            flex: 2,
            child: Container(color: Colors.orange),
          ),
          Flexible(
            flex: 2,
             
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                 
                  child: Container(color: Colors.purple),
                ),
                Flexible(
                  flex: 3,
                  child: Container(color: Colors.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
