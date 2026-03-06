import 'package:flutter_training/Datas/weather_data.dart';

extension WeatherTypeImage on WeatherType {
  String getImageName() {
    return switch (this) {
      .sunny => 'images/sunny.svg',
      .cloudy => 'images/cloudy.svg',
      .rainy => 'images/rainy.svg'
    };
  }
}