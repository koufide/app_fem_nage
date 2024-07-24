import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {


   Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
});


  final int id;
  final String name;
  final double latitude;
  final double longitude;


  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$LocationToJson(this);

}