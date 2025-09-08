import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/search_articles_use_case.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchArticlesUseCase searchArticlesUseCase;
  bool isArticlesLoading = false;
  List<ArticleEntity> articles = [];
  String articlesErrorMessage = '';

  SearchViewModel({required this.searchArticlesUseCase});

  Future<void> loadArticles(String query) async {
    isArticlesLoading = true;
    articlesErrorMessage = '';
    notifyListeners();

    if (query.isEmpty) {
      articles = [];
      isArticlesLoading = false;
      notifyListeners();
      return;
    }

    final result = await searchArticlesUseCase.invoke(query);

    result.fold(
      (left) {
        articles = left;
        isArticlesLoading = false;
        notifyListeners();
      },
      (right) {
        articlesErrorMessage = right;
        isArticlesLoading = false;
        notifyListeners();
      },
    );
  }
}
