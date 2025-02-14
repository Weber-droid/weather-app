import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();

  Future<void> fetchWeatherByCity(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(city);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLocation() async {
    _isLoading = true;
    notifyListeners();

    try {
      final position = await _locationService.getCurrentLocation();
      _weather = await _weatherService.fetchWeatherByLocation(position.latitude, position.longitude);
    } catch (e) {
      print('Error fetching weather by location: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}