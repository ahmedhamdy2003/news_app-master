import 'package:dartz/dartz.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/models/source_d_m.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository.dart';

class ArticlesRepositoryImplementation implements ArticlesRepository {
  final ArticlesDataSource articlesDataSource;
  ArticlesRepositoryImplementation({required this.articlesDataSource});

  @override
  Future<Either<List<ArticleEntity>, String>> getArticles(SourceEntity sourceEntity) async {
    final sourceDM = SourceDM.fromEntity(sourceEntity);
    final result = await articlesDataSource.getArticles(sourceDM);
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
