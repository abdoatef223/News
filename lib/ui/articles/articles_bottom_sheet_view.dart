import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c19/core/resources/colors_manager.dart';
import 'package:news_c19/core/resources/strings_manager.dart';
import 'package:news_c19/model/articles_response/Article.dart';
import 'package:url_launcher/url_launcher.dart';


class ArticlesBottomSheetView extends StatelessWidget {
  final Article article;

  const ArticlesBottomSheetView({super.key, required this.article});

  Future<void> openFullArticle() async {
    final url = article.url;
    if (url == null || url.isEmpty)
      {
        return;
      }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 220.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40.sp,
                  ),
                ),
              ),
            ),
          ),
          Text(
            article.description ?? "",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp, color: ColorsManager.lightSecondaryColor),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: openFullArticle,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.lightSecondaryColor,
                foregroundColor: ColorsManager.lightPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(StringsManager.articleFullView),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}


void showArticleBottomSheet(BuildContext context, Article article) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorsManager.lightPrimaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) => ArticlesBottomSheetView(article: article),
  );
}