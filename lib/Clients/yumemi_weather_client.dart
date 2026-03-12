import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import '../Datas/weather_data.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'dart:convert' as convert;

mixin YumemiWeatherClient {
  Future<WeatherData> fetchWeatherData();
}

class YumemiWeatherClientImpl with YumemiWeatherClient {
  @override
  Future<WeatherData> fetchWeatherData() async {
    final yumemiWeather = YumemiWeather();
    final requestData = WeatherRequestData('tokyo', .now());
    final params = convert.json.encode(requestData.toJson());
    final json = yumemiWeather.fetchWeather(params);
    final map = convert.json.decode(json) as Map<String, dynamic>;
    final weatherData = new WeatherData.fromJson(map);
    return weatherData;
  }
}