import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherProvider {
  final String apiKey;
  final String baseUrl;

  WeatherProvider({required this.apiKey, required this.baseUrl});

  Future<Map<String, dynamic>> getWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
