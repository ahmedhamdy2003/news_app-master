import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/sources_repository.dart';

class GetSourcesUseCase {
  SourcesRepository sourcesRepository;
  GetSourcesUseCase({
    required this.sourcesRepository,
  });

  Future<Either<List<SourceEntity>, String>> invoke(CategoryDM category) {
    return sourcesRepository.getSources(category);
  }
}
