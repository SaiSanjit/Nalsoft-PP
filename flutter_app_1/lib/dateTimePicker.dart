import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class Utils {

  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("MMMM dd, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

}

class DateTimePicker extends StatefulWidget{
  DateTimePicker({super.key});
  @override
  State<DateTimePicker> createState()=>_CreateDateTimePickerState();
}

class _CreateDateTimePickerState extends State<DateTimePicker>{
  late Future<DateTime?> selectedDate;
  String Date="";
  bool datePicked =false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text("Date & Time Picker")),
      body: Column(children: [ElevatedButton.icon(onPressed:(){ _showDatePicker(context);}, icon: Icon(Icons.add), label: Text("Select date")),
      datePicked?Text(Date):const Text("")],
      ),
    );
  }

 void _showDatePicker(BuildContext context){
  
  selectedDate = showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));
  selectedDate.then((value) =>{
    setState(() {
  datePicked=true    ;
  Date=Utils.getFormattedDateSimple(value!.millisecondsSinceEpoch);
    }),
  
  print(value) });

 } 
}

void main(){
  runApp(MaterialApp(home: DateTimePicker()));
}