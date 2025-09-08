import 'package:news_app/domain/entities/article_entity.dart';

class ArticleDM {
  String? title;
  String? description;
  String? author;
  String? publishedAt;
  String? url;
  String? urlToImage;

  ArticleDM({
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.urlToImage,
  });

  factory ArticleDM.fromJson(dynamic json) {
    return ArticleDM(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
        title: title,
        description: description,
        author: author,
        publishedAt: publishedAt,
        urlToImage: urlToImage,
        url: url);
  }
}
