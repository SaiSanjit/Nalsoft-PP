
import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier{
  String _userName = 'Username';
  DateTime? _selectedDate;
  int _radioValue = 1;

  void setSelectedDate(DateTime date){
    _selectedDate = date;
    notifyListeners();
  }

  void setRadioValue(int? inValue){
    _radioValue = inValue!;
    notifyListeners();
  }

  String get getUserName => _userName;
  DateTime? get getSelectedDate => _selectedDate;
  int get getRadioValue => _radioValue;

}