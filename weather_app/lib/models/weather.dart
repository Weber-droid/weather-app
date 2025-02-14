class Weather {
  final String city;
  final double temperature;
  final String description;
  final String icon;
  final List<Forecast> forecast;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    List<Forecast> forecastData = (json['list'] as List)
        .map((e) => Forecast.fromJson(e))
        .toList();

    return Weather(
      city: json['city']['name'],
      temperature: json['list'][0]['main']['temp'].toDouble(),
      description: json['list'][0]['weather'][0]['description'],
      icon: json['list'][0]['weather'][0]['icon'],
      forecast: forecastData,
    );
  }
}

class Forecast {
  final DateTime date;
  final double temperature;
  final String icon;

  Forecast({required this.date, required this.temperature, required this.icon});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']),
      temperature: json['main']['temp'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}
