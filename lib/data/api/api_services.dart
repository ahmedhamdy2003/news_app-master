import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/article_d_m.dart';
import 'package:news_app/data/models/article_response.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/data/models/source_d_m.dart';
import 'package:news_app/data/models/source_response.dart';

class ApiServices {
  static const String _baseURL = 'newsapi.org';
  static const String _sourcesEndPoint = '/v2/top-headlines/sources';
  static const String _articlesEndPoint = '/v2/top-headlines';
  static const String _searchEndPoint = '/v2/everything';
  static const String _apiKey = '17cd6e0cfa5d4fd0adda134c909d2425';

  Future<Either<List<SourceDM>, String>> getSources(CategoryDM category) async {
    try {
      Uri url = Uri.https(_baseURL, _sourcesEndPoint, {
        'apiKey': _apiKey,
        'category': category.id,
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      SourceResponse sourceResponse = SourceResponse.fromJson(json);
      if (sourceResponse.status == 'ok') {
        return left(sourceResponse.sources ?? []);
      } else {
        return right(sourceResponse.message!);
      }
    } on Exception catch (e) {
      return right(e.toString());
    }
  }

  Future<Either<List<ArticleDM>, String>> getArticles(SourceDM source) async {
    try {
      Uri url = Uri.https(_baseURL, _articlesEndPoint, {
        'apiKey': _apiKey,
        'sources': source.id,
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(json);
      if (articleResponse.status == 'ok') {
        return left(articleResponse.articles ?? []);
      } else {
        return right(articleResponse.message!);
      }
    } on Exception catch (e) {
      return right(e.toString());
    }
  }

  Future<Either<List<ArticleDM>, String>> search(String query) async {
    try {
      Uri url = Uri.https(_baseURL, _searchEndPoint, {
        'apiKey': _apiKey,
        'q': query,
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(json);
      if (articleResponse.status == 'ok') {
        return left(articleResponse.articles ?? []);
      } else {
        return right(articleResponse.message!);
      }
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
