import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/data/models/source_d_m.dart';

abstract class SourcesDataSource {
  Future<Either<List<SourceDM>, String>> getSources(CategoryDM category);
}
