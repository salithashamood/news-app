import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User(
      {this.name,
      required this.email,
      required this.password,
      this.id});

  final int? id;
  final String? name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
