import "dart:convert";
import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import "package:flutter_app_1/quoteController.dart";
import "package:flutter_app_1/quoteModal.dart";

void main() {
  runApp(MaterialApp(home: QuoteView( controller: QuoteController() )));
}


class QuoteView extends StatefulWidget {
  final QuoteController controller;
  
  
  const QuoteView( {required this.controller,super.key});

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
    fetchQuotes();
    // gotData=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quote"),
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: gotData
            ? [
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

                    Container(
                      decoration:  BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/quotebg.jpg"), fit: BoxFit.cover, ),borderRadius:BorderRadius.circular(12) ),
                      
                      width: constraints.maxWidth*0.7,
                      child: Card(
                        color: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        child: Text(quotesArr[quoteIndex]["text"],overflow: TextOverflow.fade,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
                      ),
                    ),

                    IconButton.filled(
                        onPressed: (){
                          if( quoteIndex>=quotesArr.length-1){
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
              ]
            : [Center(child: const CircularProgressIndicator.adaptive())],
      ); },)
    );
  }

  Future<void> fetchQuotes() async {
    try {
      Response response = await dio.get('https://type.fit/api/quotes',onReceiveProgress: (count, total) {
        print("total${total}");
        print(count);
        print(1-(total/count));
        
      },);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        
        List<QuoteModal> quoteModalList=[];
        for (var i in result)
       {
      QuoteModal quoteModal=QuoteModal.fromJson(i);
      quoteModalList.add(quoteModal);
      }
        print(quoteModalList[0].text);
       
        print(widget.controller.quotes);
        setState(() {
          gotData = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
