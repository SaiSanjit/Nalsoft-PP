// import 'package:flutter/material.dart';
// import 'package:mess_management/screens/route_management.dart';

// class CardList extends StatelessWidget{
//   List cardItems;
//   const CardList({  super.key});


// @override
// Widget build(BuildContext context){
//   return ListView(
//                   children: cardItems
//                       .map((item) => Container(
//                         margin: const EdgeInsets.only(left:10.0,right:10.0,bottom:4.0),
//                         height:height*0.1,
//                         child: Card(elevation: 3,
//                               child: TextButton(onPressed: () {
//                                  Navigator.pushNamed(context, RouteManagement.employeeLunchStatus);
//                               },
//                               style: TextButton.styleFrom(alignment:Alignment.centerLeft),
//                               child:Text(item,style: TextStyle(fontSize: 16,color: Colors.black87),),),
//                             ),
//                       ))
//                       .toList(),
//                 );
// }
// }