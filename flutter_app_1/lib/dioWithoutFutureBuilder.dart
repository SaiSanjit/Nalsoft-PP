import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import "package:flutter_app_1/quoteController.dart";


void main() {
  runApp(MaterialApp(home: QuoteView( )));
}


class QuoteView extends StatefulWidget {
  late  QuoteController controller;
  
  
   QuoteView( {super.key});

  @override
  State<QuoteView> createState() => _QuotesExampleState();
}

class _QuotesExampleState extends State<QuoteView> {
  List quotesArr = [];
  
  _QuotesExampleState();
  Dio dio = Dio();
  bool gotData = false;
  int quoteIndex = 0;

  @override
  void initState() {
    super.initState();
    // gotData=true;
    widget.controller=QuoteController(onDataFetched: (){
      setState(() {
        print("got the data");
        gotData=true;
      });
    });
    widget.controller.fetchQuotes();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quote"),
      ),
      body:LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
            [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                        onPressed: (){
                          if( quoteIndex<=0){
                            return;
                          }
                          else{
                            setState(() {
                              quoteIndex--;
                            });
                          }
                        },
                        icon: Icon(Icons.navigate_before_rounded)),

                    gotData?   Container(
                      decoration:  BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/quotebg.jpg"), fit: BoxFit.cover, ),borderRadius:BorderRadius.circular(12) ),
                      
                      width: constraints.maxWidth*0.7,
                      child: Card(
                        color: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        child: Text(widget.controller.quoteModal.quotes[quoteIndex].text!,overflow: TextOverflow.fade,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
                      ),
                    )
: CircularProgressIndicator(),
                    IconButton.filled(
                        onPressed: (){
                          if( quoteIndex>=widget.controller.quoteModal.quotes.length-1){
                            return;
                          }
                          else{
                            setState(() {
                              quoteIndex++;
                            });
                          }
                        },
                        icon: Icon(Icons.navigate_next_rounded))
                  ],
                ),
              ],
           
      ); },),
    );
  }


}
