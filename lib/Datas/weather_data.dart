import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherRequestData {
  String area;
  DateTime date;

  WeatherRequestData(this.area, this.date);

  Map<String, dynamic> toJson() {
    return {
      'area': area,
      'date': date.toIso8601String(),
    };
  }
}

class WeatherData {
  WeatherType weatherType;
  int maxTemp;
  int minTemp;
  String date;

  WeatherData(this.weatherType, this.maxTemp, this.minTemp, this.date);

  WeatherData.fromJson(Map<String, dynamic> json)
    : weatherType = WeatherType.fromString(json['weather_condition'] as String) ?? .sunny, // MEMO：一旦sunnyを返す
      maxTemp = json['max_temperature'] as int,
      minTemp = json['min_temperature'] as int,
      date = json['date'] as String;
}

enum WeatherType { 
  sunny, 
  cloudy,
  rainy;

  static WeatherType? fromString(String value) {
    return switch(value) {
      'sunny' => .sunny,
      'cloudy' => .cloudy,
      'rainy' => .rainy,
      _ => null
    };
  }
}