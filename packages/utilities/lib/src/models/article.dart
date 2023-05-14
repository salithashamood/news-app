import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:utilities/src/models/source.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  const Article(
      {this.author, this.content, this.description, this.publishedAt, this.source, this.title, this.url, this.urlToImage});

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;


  @override
  List<Object?> get props => [];

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

