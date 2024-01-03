import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WeatherController.dart';
import 'WeatherModel.dart';
import 'WeatherProvider.dart';
import 'WeatherView.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => WeatherModel()),
        Provider(
          create: (context) => WeatherController(
            weatherProvider: WeatherProvider(apiKey: 'your_api_key', baseUrl: 'https://api.openweathermap.org/data/2.5'),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: WeatherView(),
      ),
    );
  }
}
