import 'package:flutter/material.dart';
import 'package:news_app/presentaion/main_layout.dart';
import 'package:news_app/presentaion/search_view.dart';

class RoutesManager {
  static const String mainLayout = '/mainLayout';
  static const String searchView = '/searchView';
  // static const String newsScreenRoute = '/newsScreenRoute';
  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return MaterialPageRoute(
          builder: (context) => const MainLayout(),
        );
      case searchView:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
        );
      // case newsScreenRoute:
      //   return MaterialPageRoute(
      //     settings:  settings,
      //     builder: (context) => NewsScreen(),
      //   );
    }
    return null;
  }
}
