import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repository_contract/search_repository.dart';

class SearchArticlesUseCase {
  final SearchRepository searchRepository;
  SearchArticlesUseCase({required this.searchRepository});

  Future<Either<List<ArticleEntity>, String>> invoke(String query) {
    return searchRepository.searchArticles(query);
  }
}
