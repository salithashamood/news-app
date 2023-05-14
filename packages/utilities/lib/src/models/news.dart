import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:utilities/src/models/article.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  const News({this.articles, this.status, this.totalResults});

  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  @override
  List<Object?> get props => [articles];

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
