
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {

  final double? temperature;
  @JsonKey(name: 'weathercode')
  final double? weatherCode;

   Weather({this.temperature, this.weatherCode});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$WeatherToJson(this);

}