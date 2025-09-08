import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';

abstract class ArticlesRepository {
  Future<Either<List<ArticleEntity>, String>> getArticles(SourceEntity sourceEntity);
}
