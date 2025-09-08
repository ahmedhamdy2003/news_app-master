import 'package:news_app/data/models/article_d_m.dart';

class ArticleResponse {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<ArticleDM>? articles;

  ArticleResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory ArticleResponse.fromJson(dynamic json) {
    List<ArticleDM> articlesList = [];
    if (json['articles'] != null) {
      for (var article in json['articles']) {
        articlesList.add(ArticleDM.fromJson(article));
      }
    }

    return ArticleResponse(
      status: json['status'] ?? '',
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      totalResults: json['totalResults'] ?? '',
      articles: articlesList,
    );
  }
}
