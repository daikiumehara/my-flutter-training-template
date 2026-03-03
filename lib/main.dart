import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              const Expanded(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Placeholder(),
                      ),
                      Row(
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
                              onPressed: () {}, 
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