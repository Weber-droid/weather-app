import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;
  String _errorMessage = '';

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchWeatherByCity(String city) async {
    _setLoading(true);
    try {
      _weather = await _weatherService.fetchWeatherByCity(city);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Could not fetch weather data';
    }
    _setLoading(false);
  }

  Future<void> fetchWeatherByLocation() async {
    _setLoading(true);
    try {
      Position position = await _determinePosition();
      _weather = await _weatherService.fetchWeatherByLocation(position.latitude, position.longitude);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Could not fetch weather data';
    }
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
