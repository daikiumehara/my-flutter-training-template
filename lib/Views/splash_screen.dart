import 'package:flutter/material.dart';
import 'package:flutter_training/Clients/yumemi_weather_client.dart';
import 'package:flutter_training/Views/weather_detail_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

mixin SplashStateInitStateMixin on State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await WidgetsBinding.instance.endOfFrame;
      await navigateToMain();
    });
  }

  Future<void> navigateToMain();
}

class SplashState extends State<SplashScreen> with RouteAware, SplashStateInitStateMixin {
  @override
  Future<void> navigateToMain() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) {
          return WeatherdetailScreen(
            weatherClient: YumemiWeatherClientImpl(),
          );
        },
      ),
    );

    await navigateToMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Container()
      );
  }
}
