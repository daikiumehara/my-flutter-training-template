import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import '../Datas/weather_data.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

interface class YumemiWeatherClient {
  Future<WeatherData> fetchWeatherData() async {
    return .new(.sunny);  
  }
}

class YumemiWeatherClientImpl implements YumemiWeatherClient {
  @override
  Future<WeatherData> fetchWeatherData() async {
    final yumemiWeather = YumemiWeather();
    final weatherCondition = yumemiWeather.fetchThrowsWeather('tokyo');
    final weatherType = WeatherType.fromString(weatherCondition);
    if(weatherType == null) {
      return .new(.sunny);
    }
    return .new(weatherType);
  }
}