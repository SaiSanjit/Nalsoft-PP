import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WeatherModel.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherModel = Provider.of<WeatherModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Weather in ${weatherModel.cityName}: ${weatherModel.temperature}°C'),
          if (weatherModel.errorMessage.isNotEmpty) Text(weatherModel.errorMessage),
        ],
      ),
    );
  }
}
