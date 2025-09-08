import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/article_entity.dart';

abstract class SearchRepository {
  Future<Either<List<ArticleEntity>, String>> searchArticles(String query);
}
