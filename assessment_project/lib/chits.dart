import "dart:math";
import "package:assessment_project/routes.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter/material.dart";

class Chits extends StatefulWidget{

  Chits({super.key});
  List players= ['Rohith','Sanjit','Madhan'];

  @override
  State<Chits> createState() => _CreateChitsState(players);
}

class _CreateChitsState extends State<Chits> {
  List players;
  
  _CreateChitsState(this.players);
  
  @override
  Widget build(BuildContext context){
    players.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Secret Santa'),
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          } 
        ),
        actions: [Image(image: AssetImage('assets/images/santa.jpg'))],
        ),
      body: Column(
        children: [
         Flexible(flex:1, child: Text('Pick a chit',style:GoogleFonts.comfortaa(fontSize: 24))),
          Flexible(
            flex: 4,
            child: ListView(              
              children: players.map((playerName) =>
              CardGenerator(name:playerName)
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

}

class CardGenerator extends StatelessWidget{
  final name;

  const CardGenerator({super.key, this.name});
  @override
  Widget build(BuildContext context){
    return Card(
            
            elevation: 10,
             shadowColor: Colors.black,
             child: SizedBox(
              height:100 ,
              child: TextButton(child: const Text('Click to reveal'),onPressed: (){
             showDialog(context: context, builder: (BuildContext context){
              return  AlertDialog(title: Text(name??'error'),
              actions:  [TextButton(onPressed:()=> Navigator.pushNamed(context, RouteGenerator.products), child: const Text('Gift them joy!'))],
              );
             });
             } ,),),
            
          );
  }
}