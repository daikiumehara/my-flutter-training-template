// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRequestData _$WeatherRequestDataFromJson(Map<String, dynamic> json) =>
    WeatherRequestData(
      json['area'] as String,
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$WeatherRequestDataToJson(WeatherRequestData instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };

const _$WeatherRequestDataJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'area': {'type': 'string'},
    'date': {'type': 'string', 'format': 'date-time'},
  },
  'required': ['area', 'date'],
};

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
  $enumDecode(_$WeatherTypeEnumMap, json['weather_condition']),
  (json['max_temperature'] as num).toInt(),
  (json['min_temperature'] as num).toInt(),
  json['date'] as String,
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'weather_condition': _$WeatherTypeEnumMap[instance.weatherType]!,
      'max_temperature': instance.maxTemp,
      'min_temperature': instance.minTemp,
      'date': instance.date,
    };

const _$WeatherDataJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'weather_condition': {'type': 'object'},
    'max_temperature': {'type': 'integer'},
    'min_temperature': {'type': 'integer'},
    'date': {'type': 'string'},
  },
  'required': [
    'weather_condition',
    'max_temperature',
    'min_temperature',
    'date',
  ],
};

const _$WeatherTypeEnumMap = {
  WeatherType.sunny: 'sunny',
  WeatherType.cloudy: 'cloudy',
  WeatherType.rainy: 'rainy',
};
