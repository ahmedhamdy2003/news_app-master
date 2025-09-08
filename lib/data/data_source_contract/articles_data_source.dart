import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/article_d_m.dart';
import 'package:news_app/data/models/source_d_m.dart';

abstract class ArticlesDataSource {
  Future<Either<List<ArticleDM>, String>> getArticles(SourceDM sourceDM);
}
