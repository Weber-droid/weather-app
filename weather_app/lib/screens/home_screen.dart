import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/search_bar.dart';
import '../widgets/weather_icon.dart';
import '../widgets/forecast_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Weather Forecast')),
      body: Column(
        children: [
          SearchBarr(onSearch: weatherProvider.fetchWeatherByCity),
          ElevatedButton(
            onPressed: weatherProvider.fetchWeatherByLocation,
            child: Text('Get Weather by Location'),
          ),
          if (weatherProvider.isLoading)
            CircularProgressIndicator()
          else if (weatherProvider.weather != null)
            Expanded(
              child: Column(
                children: [
                  Text(weatherProvider.weather!.cityName),
                  Text('${weatherProvider.weather!.temperature}°C'),
                  WeatherIcon(iconUrl: weatherProvider.weather!.icon),
                  ForecastList(forecast: weatherProvider.weather!.forecast),
                ],
              ),
            ),
        ],
      ),
    );
  }
}