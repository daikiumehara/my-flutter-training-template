import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable(createJsonSchema: true)
class WeatherRequestData {
  WeatherRequestData(this.area, this.date);

  String area;
  DateTime date;

  Map<String, dynamic> toJson() => _$WeatherRequestDataToJson(this);
}

@JsonSerializable(createJsonSchema: true)
class WeatherData {
  WeatherData(this.weatherType, this.maxTemp, this.minTemp, this.date);

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);

  @JsonKey(name: 'weather_condition')
  WeatherType weatherType;
  @JsonKey(name: 'max_temperature')
  int maxTemp;
  @JsonKey(name: 'min_temperature')
  int minTemp;
  String date;
}

enum WeatherType { 
  @JsonValue('sunny')
  sunny, 
  @JsonValue('cloudy')
  cloudy,
  @JsonValue('rainy')
  rainy;
}