import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/usecases/get_articles_use_case.dart';
import 'package:news_app/domain/usecases/get_sources_use_case.dart';

class SourcesViewModel extends ChangeNotifier {
  GetSourcesUseCase getSourcesUseCase;
  GetArticlesUseCase getArticlesUseCase;
  SourcesViewModel({
    required this.getSourcesUseCase,
    required this.getArticlesUseCase,
  });

  bool isSourcesLoading = true;
  bool isArticlesLoading = true;
  List<SourceEntity> sources = [];
  List<ArticleEntity> articles = [];
  String sourcesErrorMessage = '';
  String articlesErrorMessage = '';
  Future<void> loadSources(CategoryDM category) async {
    var result = await getSourcesUseCase.invoke(category);
    result.fold(
      (left) {
        sources = left;
        isSourcesLoading = false;
        notifyListeners();
      },
      (right) {
        sourcesErrorMessage = right;
        notifyListeners();
      },
    );
  }

  void loadArticles(SourceEntity sourceEntity) async {
    isArticlesLoading = true;
    notifyListeners();
    var result = await getArticlesUseCase.invoke(sourceEntity);
    result.fold(
      (left) {
        articles = left;
        isArticlesLoading = false;
        notifyListeners();
      },
      (right) {
        articlesErrorMessage = right;
        notifyListeners();
      },
    );
  }
}
