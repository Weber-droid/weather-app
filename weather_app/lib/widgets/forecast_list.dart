import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'weather_icon.dart';

class ForecastList extends StatelessWidget {
  final List<DailyForecast> forecast;

  const ForecastList({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable scrolling
      itemCount: forecast.length,
      itemBuilder: (context, index) {
        final dailyForecast = forecast[index];
        return ListTile(
          leading: WeatherIcon(iconUrl: dailyForecast.icon),
          title: Text(dailyForecast.day),
          subtitle: Text('${dailyForecast.temperature.toStringAsFixed(1)}°C'),
        );
      },
    );
  }
}