import "dart:ui";

import "package:flutter/material.dart";

class Assets extends StatelessWidget {
  const Assets({super.key});
@override
Widget build(BuildContext context){
  return const MaterialApp(
    home: Scaffold(
      body: Row(
        children: [
          Column(children: [
            Image(image: AssetImage('images/iphone.jpg'),height: 240,width: 160,),
            Image(image: AssetImage('images/samsung.jpg'),height: 100,width: 160,),
            Image(image: AssetImage('images/sony.jpg'),height: 240,width: 160,),
          ],),
          Column(children: [Text('''Lorem Ipsum is simply dummy text of the printing and
          typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',style: TextStyle(fontFamily: 'RubikMaps-Regular'),),
                                  
          Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          Lorem Ipsum has been the industry's standard dummy ''',style: TextStyle(fontFamily: 'Kalnia',fontStyle: FontStyle.italic ),),
          Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          Lorem Ipsum has been the industry's standard dummy ''')],)
        
        ],
        
      ),
    ),
  );
}
}


void main() {
  runApp(const Assets());
}
