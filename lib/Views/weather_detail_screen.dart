import 'package:flutter/material.dart';
import 'package:flutter_training/Clients/yumemi_weather_client.dart';
import 'package:flutter_training/Datas/weather_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/Views/Extensions/weather_type_extension.dart';

class Weatherdetailscreen extends StatefulWidget {
  final YumemiWeatherClient weatherClient;

  Weatherdetailscreen({
    required this.weatherClient,
  });

  @override
  State<StatefulWidget> createState() {
    return WeatherdetailState(weatherClient: weatherClient);
  }
}

class WeatherdetailState extends State<Weatherdetailscreen> {
  final YumemiWeatherClient weatherClient;
  WeatherData? weatherData;

  WeatherdetailState({
    required this.weatherClient,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: () {
                          final imageName = weatherData?.weatherType.getImageName();
                          if(imageName == null) {
                              return const Placeholder();
                          }
                          return SvgPicture.asset(imageName);
                        }()
                      ),
                      const Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          TemperatureLabel(
                            temperature: '20',
                            textColor: Colors.blue,
                          ),
                          TemperatureLabel(
                            temperature: '15',
                            textColor: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Row(
                          mainAxisAlignment: .spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {}, 
                              child: const Text('Close')
                            ),
                            TextButton(
                              onPressed: () async {
                                final value = await weatherClient.fetchWeatherData();
                                setState(() {
                                  weatherData = value;
                                });
                              }, 
                              child: const Text('Reload')
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureLabel extends StatelessWidget {
  final String temperature;
  final Color textColor;

  const TemperatureLabel({
    required this.temperature, 
    required this.textColor,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        '** ℃',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: textColor),
          textAlign: TextAlign.center,  
        )
    );
  }
}