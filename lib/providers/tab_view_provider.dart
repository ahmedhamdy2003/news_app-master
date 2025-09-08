import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/presentaion/categories_view.dart';
import 'package:news_app/presentaion/sources_view.dart';

class TabViewProvider extends ChangeNotifier {
  Widget tabView = const CategoriesView();
  String tabTitle = 'Home';

  void viewSources(CategoryDM categoryDM) {
    tabView = SourcesView(categoryDM: categoryDM);
    tabTitle = categoryDM.title;
    notifyListeners();
  }

  void viewCategories() {
    tabView = const CategoriesView();
    tabTitle = 'Home';
    notifyListeners();
  }
}
