import 'package:flutter/material.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/widgets/article_card.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/providers/sources_view_model.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({
    super.key,
    required this.categoryDM,
  });
  final CategoryDM categoryDM;
  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    sourcesViewModel = Provider.of<SourcesViewModel>(context, listen: false);
    await sourcesViewModel.loadSources(widget.categoryDM);
    sourcesViewModel.loadArticles(sourcesViewModel.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SourcesViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isSourcesLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.black,
              ));
            }
            if (viewModel.sourcesErrorMessage.isNotEmpty) {
              return Center(child: Text(viewModel.sourcesErrorMessage));
            }
            return DefaultTabController(
              length: viewModel.sources.length,
              child: TabBar(
                onTap: (index) {
                  viewModel.loadArticles(viewModel.sources[index]);
                },
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                tabs: viewModel.sources.map((source) => Tab(text: source.name)).toList(),
              ),
            );
          },
        ),
        Expanded(
          child: Consumer<SourcesViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isArticlesLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.black,
                ));
              }
              if (viewModel.articlesErrorMessage.isNotEmpty) {
                return Center(child: Text(viewModel.articlesErrorMessage));
              }
              return ListView.builder(
                itemBuilder: (context, index) => ArticleCard(
                  articleEntity: viewModel.articles[index],
                ),
                itemCount: viewModel.articles.length,
              );
            },
          ),
        )
      ],
    );
  }
}
