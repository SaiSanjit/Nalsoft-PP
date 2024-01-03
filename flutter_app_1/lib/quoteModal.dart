class QuoteModal{
List<Quote> quotes;
QuoteModal(this.quotes);

  factory QuoteModal.fromJsonList(List jsonList){
    List<Quote> quoteList = jsonList.map((json) => Quote.fromJson(json)).toList();
  return QuoteModal(quoteList);
  }
}


class Quote {
  String? text;
  String? author;

  Quote( {required this.text,required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
  return Quote(
    text:json["text"] as String,
    author:json["author"] as String, 
  );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['author'] = this.author;
    return data;
  }
}