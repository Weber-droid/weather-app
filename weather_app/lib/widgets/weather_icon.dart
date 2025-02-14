import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String iconUrl;

  const WeatherIcon({required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://openweathermap.org/img/wn/$iconUrl@2x.png',
      width: 50,
      height: 50,
    );
  }
}