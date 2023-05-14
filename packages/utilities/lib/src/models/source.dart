import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends Equatable {
  const Source(
      {this.name,
      this.id});

  final String? id;
  final String? name;

  @override
  List<Object?> get props => [];

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
