import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _email='';
  String empName='';
  String _department='';
  String _floor='';
  Map<DateTime,String> _events={};

  Map<DateTime,String> get events=>_events;

  void updateEvents(Map<DateTime,String> updatedEvents){
    _events=updatedEvents;
    notifyListeners();
  }
}