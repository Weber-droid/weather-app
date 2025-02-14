import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  
  WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${weather.city}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
        Text('${weather.temperature}°C', style: TextStyle(fontSize: 30)),
        Text(weather.description, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
