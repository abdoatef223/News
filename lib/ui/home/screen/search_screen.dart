import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_c19/model/articles_response/Article.dart';

import '../../../core/remote/network/api_manager.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../model/category_model.dart';
import '../../articles/article_item.dart';
import '../widgets/search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CategoryModel? selectedCategory;
  List<Article> articles = [];
  bool isSearching = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: isSearching
            ? Search(
          onSearch: (query) => searchEvents(query),
          onClose: () => Navigator.of(context).pop(),
        )
            : Text(selectedCategory != null
            ? selectedCategory!.title
            : StringsManager.home),
        actions: [
          if (!isSearching)
            IconButton(
              onPressed: () => setState(() => isSearching = true),
              icon: SvgPicture.asset(AssetsManager.search),
            ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : articles.isEmpty
          ? const Center(child: Text("No News Found"))
          : ListView.separated(
        padding: REdgeInsets.all(16),
        itemCount: articles.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return ArticleItem(articles[index]);
        },
      ),
    );
  }

  void selectCategory(CategoryModel newCategory){
    setState(() {
      selectedCategory = newCategory;
    });
  }

  Future<void> loadEvents() async {
    if (!mounted) return;  // the mounted checks before the set state so help the app don't crash if the app got disposed while the network request still in flight
    setState(() => isLoading = true);
    var response = await ApiManager.searchArticles("Events");
    if (!mounted) return;
    setState(() {
      articles = response?.articles ?? [];
      isLoading = false;
    });
  }

  Future<void> searchEvents(String query) async {
    if (query.isEmpty) {
      loadEvents();
      return;
    }
    if (!mounted) return; // Same as the loadEvents
    setState(() => isLoading = true);
    var response = await ApiManager.searchArticles(query);

    if (!mounted) return;
    setState(() {
      articles = response?.articles ?? [];
      isLoading = false;
    });
  }

}