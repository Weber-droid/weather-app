import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  static const String _apiKey = 'd69881bea4b0af18b5c3c20e324151da';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  Future<Weather> fetchWeatherByCity(String city) async {
    final url = '$_baseUrl?q=$city&appid=$_apiKey&units=metric';
    return _fetchWeather(url);
  }

  Future<Weather> fetchWeatherByLocation(double lat, double lon) async {
    final url = '$_baseUrl?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    return _fetchWeather(url);
  }

  Future<Weather> _fetchWeather(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
