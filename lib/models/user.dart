import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String nom;
  final String mobile;
  final String email;
  final String password;


  User({
    required this.id,
    required this.nom,
    required this.mobile,
    required this.email,
    required this.password
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);


} // User
