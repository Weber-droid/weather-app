import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../utils/constants.dart';

class WeatherService {
  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/weather?q=$city&appid=${Constants.apiKey}&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return _parseWeather(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Weather _parseWeather(Map<String, dynamic> data) {
    return Weather(
      cityName: data['name'],
      temperature: data['main']['temp'],
      condition: data['weather'][0]['main'],
      icon: data['weather'][0]['icon'],
      forecast: [], // Fetch 5-day forecast separately
    );
  }
}