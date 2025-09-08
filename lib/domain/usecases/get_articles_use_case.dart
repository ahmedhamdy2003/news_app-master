import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository.dart';

class GetArticlesUseCase {
  ArticlesRepository articlesRepository;
  GetArticlesUseCase({
    required this.articlesRepository,
  });

  Future<Either<List<ArticleEntity>, String>> invoke(SourceEntity sourceEntity) {
    return articlesRepository.getArticles(sourceEntity);
  }
}
