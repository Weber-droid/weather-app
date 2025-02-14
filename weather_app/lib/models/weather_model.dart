class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String icon;
  final List<DailyForecast> forecast;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.forecast,
  });
}

class DailyForecast {
  final String day;
  final double temperature;
  final String icon;

  DailyForecast({
    required this.day,
    required this.temperature,
    required this.icon,
  });
}