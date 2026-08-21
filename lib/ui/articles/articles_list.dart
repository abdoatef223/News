import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c19/core/remote/network/api_manager.dart';
import 'package:news_c19/ui/articles/article_item.dart';

class ArticlesList extends StatefulWidget {
  String sourceId;
  ArticlesList(this.sourceId);

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(widget.sourceId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(children: [
              Text("No Internet Connection"),
              ElevatedButton(onPressed: () {
                setState(() {

                });
              }, child: Text("Try Again"))
            ],);
          }
          var articlesResponse = snapshot.data!;
          if(articlesResponse.status=="error"){
            return Column(children: [
              Text(articlesResponse.message??""),
              ElevatedButton(onPressed: () {
                setState(() {

                });
              }, child: Text("Try Again"))
            ],);
          }
          var articlesList = articlesResponse.articles??[];
          if(articlesList.isEmpty){
            return Center(child: Text("No articles found"),);
          }
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(articlesList[index]),
              separatorBuilder: (context, index) => SizedBox(height: 24.h,),
              itemCount: articlesList.length
          );
        },);
  }
}
