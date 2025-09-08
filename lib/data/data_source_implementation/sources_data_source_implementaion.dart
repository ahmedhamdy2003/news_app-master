import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/data/models/source_d_m.dart';

class SourcesApiDataSourceImplementaion extends SourcesDataSource {
  ApiServices apiServices;
  SourcesApiDataSourceImplementaion({required this.apiServices});
  @override
  Future<Either<List<SourceDM>, String>> getSources(CategoryDM category) {
    return apiServices.getSources(category);
  }
}
