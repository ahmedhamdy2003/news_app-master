import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/domain/entities/source_entity.dart';

abstract class SourcesRepository {
  Future<Either<List<SourceEntity>, String>> getSources(CategoryDM category);
}
