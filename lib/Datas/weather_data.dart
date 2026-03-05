class WeatherData {
  WeatherType weatherType;

  WeatherData(this.weatherType);
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