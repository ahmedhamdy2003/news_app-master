import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repository_contract/search_repository.dart';

class SearchRepositoryImplementation implements SearchRepository {
  final ApiServices apiServices;
  SearchRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<List<ArticleEntity>, String>> searchArticles(String query) async {
    final result = await apiServices.search(query);
    return result.fold(
      (left) {
        final articles = left.map((articleDM) => articleDM.toEntity()).toList();
        return Left(articles);
      },
      (right) {
        return Right(right);
      },
    );
  }
}
