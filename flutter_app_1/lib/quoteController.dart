import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_app_1/quoteModal.dart';

class QuoteController{
  late QuoteModal _quoteModal;
  late VoidCallback onDataFetched;

  QuoteController({required this.onDataFetched});
  QuoteModal get quoteModal => _quoteModal;
   
  Future<void> fetchQuotes() async {
    try {
      Dio dio=Dio();
      var response = await dio.get('https://type.fit/api/quotes',onReceiveProgress: (count, total) {
        print("total${total}");
        print(count);
        print(1-(total/count));
        
      }
    
      );
        onDataFetched();
      var result=jsonDecode(response.data);
     _quoteModal = QuoteModal.fromJsonList(result);
    } catch (e) {
      print(e);
    }
  }
}