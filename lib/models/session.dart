import 'package:app_fem_nage/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  User? user;
  Session({this.user});


  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SessionToJson(this);


}
