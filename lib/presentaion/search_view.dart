import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/article_card.dart';
import 'package:news_app/providers/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController searchController;
  late SearchViewModel searchViewModel;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchViewModel = Provider.of<SearchViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    searchViewModel.articles.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                onChanged: (value) {
                  searchViewModel.loadArticles(value);
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(child: Consumer<SearchViewModel>(
              builder: (context, searchViewModel, child) {
                if (searchViewModel.articles.isEmpty) {
                  return Center(
                      child: Text(
                    'No Articles',
                    style: Theme.of(context).textTheme.titleMedium,
                  ));
                }

                if (searchViewModel.isArticlesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (searchViewModel.articlesErrorMessage.isNotEmpty) {
                  return Center(child: Text(searchViewModel.articlesErrorMessage));
                }

                return ListView.builder(
                  itemCount: searchViewModel.articles.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(articleEntity: searchViewModel.articles[index]);
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
