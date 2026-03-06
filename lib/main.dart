import 'package:flutter/material.dart';
import 'package:flutter_training/Clients/yumemi_weather_client.dart';
import 'package:flutter_training/Views/weather_detail_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Weatherdetailscreen(weatherClient: YumemiWeatherClientImpl());
  }
}