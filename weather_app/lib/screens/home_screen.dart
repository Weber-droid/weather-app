import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: weatherProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : weatherProvider.weather != null
              ? WeatherCard(weather: weatherProvider.weather!)
              : Center(child: Text('Search for a city or fetch your location weather')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'search',
            child: Icon(Icons.search),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'location',
            child: Icon(Icons.my_location),
            onPressed: weatherProvider.fetchWeatherByLocation,
          ),
        ],
      ),
    );
  }
}
