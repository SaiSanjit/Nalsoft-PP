import "package:flutter/material.dart";

class Miscelleneous extends StatefulWidget {
  const Miscelleneous({super.key});

  @override
  State<Miscelleneous> createState() => _CreateMiscelleneousState();
}

class _CreateMiscelleneousState extends State<Miscelleneous> {
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Miscelleneous',
      home: Scaffold(
      backgroundColor: Color.fromARGB(224, 225, 235, 221),
      appBar: AppBar(title: Text('Miscelleneous'),),
      body: Card(child: Column(children: [
        Text('1'),
        // Divider(),
        Text('2'),
        
      ],)),
      drawer: Drawer(child: Column(children: [
        Text('2'),
        // Divider(),
        Text('2'),
        
      ]),),
      ),
      );
  }
}

void main(){
  runApp(const Miscelleneous());
}