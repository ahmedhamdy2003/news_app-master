import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/models/category_d_m.dart';
import 'package:news_app/providers/tab_view_provider.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var tabViewProvider = Provider.of<TabViewProvider>(context);

    return Padding(
      padding: REdgeInsets.only(
        top: 12,
        left: 12,
        right: 12,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning\nHere is Some News For You',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16.h),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: CategoryDM.categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  tabViewProvider.viewSources(CategoryDM.categoriesList[index]);
                },
                child: CategoryCard(
                  categoriesDM: CategoryDM.categoriesList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoriesDM,
  });
  final CategoryDM categoriesDM;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(categoriesDM.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            Positioned(
              bottom: 20.sp,
              right: 20.sp,
              child: Container(
                alignment: Alignment.center,
                height: 54.h,
                width: 170.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84.r),
                  color: ColorsManager.gray,
                ),
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
