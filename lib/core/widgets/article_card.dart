import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.articleEntity,
  });
  final ArticleEntity articleEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showArticleBottomSheet(context);
      },
      child: Container(
        margin: REdgeInsets.only(top: 16, left: 12, right: 12),
        padding: REdgeInsets.all(8),
        height: 322.h,
        width: 362.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: articleEntity.urlToImage ?? '',
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.black,
                  value: downloadProgress.progress,
                )),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ColorsManager.black,
                ),
              ),
            ),
            Text(
              articleEntity.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightForFinite(width: 200.w),
                  child: Text(
                    articleEntity.author ?? '',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  getTimeAgo(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getTimeAgo() {
    String dateTimeString = articleEntity.publishedAt ?? '';
    DateTime dateTime = DateTime.parse(dateTimeString);
    String timeAgo = timeago.format(dateTime);
    return timeAgo;
  }

  void _showArticleBottomSheet(BuildContext context) {
    showModalBottomSheet(
      // isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        // margin: REdgeInsets.all(16),
        margin: REdgeInsets.only(
          right: 12,
          left: 12,
          bottom: 22,
        ),
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.clear,
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: articleEntity.urlToImage ?? '',
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.black,
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ColorsManager.black,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              articleEntity.description ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {
                _launchUrl();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  padding: REdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  )),
              child: Text('View Full Articel', style: Theme.of(context).textTheme.titleMedium),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri articleUrl = Uri.parse(articleEntity.url!);

    if (!await launchUrl(
      articleUrl,
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch $articleUrl');
    }
  }
}
