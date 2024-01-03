import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WeatherModel.dart';
import 'WeatherProvider.dart';

class WeatherController {
  final WeatherProvider weatherProvider;

  WeatherController({required this.weatherProvider});

  Future<void> getWeather(BuildContext context, String city) async {
    try {
      final weatherData = await weatherProvider.getWeather(city);
      Provider.of<WeatherModel>(context, listen: false).update(
        cityName: weatherData['name'],
        temperature: weatherData['main']['temp'].toDouble(),
      );
    } catch (e) {
      Provider.of<WeatherModel>(context, listen: false).updateError('Error fetching weather data: $e');
    }
  }
}
