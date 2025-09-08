import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme_manager.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/data/data_source_implementation/articles_data_source_implementation.dart';
import 'package:news_app/data/data_source_implementation/sources_data_source_implementaion.dart';
import 'package:news_app/data/repository_implementation/articles_repository_implementation.dart';
import 'package:news_app/data/repository_implementation/search_repository_implementaion.dart';
import 'package:news_app/data/repository_implementation/sources_repository_implementation.dart';
import 'package:news_app/domain/usecases/get_articles_use_case.dart';
import 'package:news_app/domain/usecases/get_sources_use_case.dart';
import 'package:news_app/domain/usecases/search_articles_use_case.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:news_app/providers/search_view_model.dart';
import 'package:news_app/providers/sources_view_model.dart';
import 'package:news_app/providers/tab_view_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabViewProvider()),
        ChangeNotifierProvider(
          create: (_) => SourcesViewModel(
            getSourcesUseCase: GetSourcesUseCase(
              sourcesRepository: SourcesRepositoryImplementation(
                sourcesDataSource: SourcesApiDataSourceImplementaion(
                  apiServices: ApiServices(),
                ),
              ),
            ),
            getArticlesUseCase: GetArticlesUseCase(
              articlesRepository: ArticlesRepositoryImplementation(
                articlesDataSource: ArticlesApiDataSourceImplementation(
                  apiServices: ApiServices(),
                ),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchViewModel(
            searchArticlesUseCase: SearchArticlesUseCase(
              searchRepository: SearchRepositoryImplementation(
                apiServices: ApiServices(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => ConfigProvider()),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.mainLayout,
        onGenerateRoute: RoutesManager.router,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: Provider.of<ConfigProvider>(context).currentTheme,
        locale: const Locale('en'),
      ),
    );
  }
}

extension ContextEx on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
