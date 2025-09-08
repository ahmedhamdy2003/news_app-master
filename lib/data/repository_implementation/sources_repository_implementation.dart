import 'package:dartz/dartz.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/sources_repository.dart';

class SourcesRepositoryImplementation implements SourcesRepository {
  final SourcesDataSource sourcesDataSource;
  SourcesRepositoryImplementation({required this.sourcesDataSource});

  @override
  Future<Either<List<SourceEntity>, String>> getSources(CategoryDM categoryDM) async {
    final result = await sourcesDataSource.getSources(categoryDM);
    return result.fold(
      (left) {
        final sources = left.map((sourceDM) => sourceDM.toEntity()).toList();
        return Left(sources);
      },
      (right) {
        return Right(right);
      },
    );
  }
}
