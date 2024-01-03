import 'package:flutter/foundation.dart';

class WeatherModel extends ChangeNotifier {
  String _cityName = '';
  double _temperature = 0.0;
  String _errorMessage = '';

  String get cityName => _cityName;
  double get temperature => _temperature;
  String get errorMessage => _errorMessage;

  void update({required String cityName, required double temperature}) {
    _cityName = cityName;
    _temperature = temperature;
    _errorMessage = '';
    notifyListeners();
  }

  void updateError(String errorMessage) {
    _cityName = '';
    _temperature = 0.0;
    _errorMessage = errorMessage;
    notifyListeners();
  }
}
