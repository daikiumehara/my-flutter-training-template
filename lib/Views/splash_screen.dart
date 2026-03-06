import 'package:flutter/material.dart';
import 'package:flutter_training/Clients/yumemi_weather_client.dart';
import 'package:flutter_training/Views/weather_detail_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> with RouteAware {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await WidgetsBinding.instance.endOfFrame;
      _navigateToWeatherDetail();
    });
  }

  void _navigateToWeatherDetail() async {
    await Future.delayed(Duration(milliseconds: 500));
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherdetailScreen(
            weatherClient: YumemiWeatherClientImpl(),
          );
        },
      ),
    );

    _navigateToWeatherDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Container()
      );
  }
}