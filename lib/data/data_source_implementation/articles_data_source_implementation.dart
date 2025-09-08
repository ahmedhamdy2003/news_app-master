import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/models/article_d_m.dart';
import 'package:news_app/data/models/source_d_m.dart';

class ArticlesApiDataSourceImplementation extends ArticlesDataSource {
  ApiServices apiServices;
  ArticlesApiDataSourceImplementation({required this.apiServices});
  @override
  Future<Either<List<ArticleDM>, String>> getArticles(SourceDM sourceDM) {
    return apiServices.getArticles(sourceDM);
  }
}
