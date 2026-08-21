import 'package:dio/dio.dart';
import 'package:news_c19/core/resources/app_constants.dart';
import 'package:news_c19/model/articles_response/Articles_response.dart';
import 'package:news_c19/model/sources_response/Sources_response.dart';

class ApiManager{
  static Dio dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));
  static Future<SourcesResponse?> getSources(String category)async{
    try{
      var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
        "apiKey":AppConstants.apiKey,
        "category":category
      });
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse;
    }catch(e){
      print("No Internet Connection");
    }
  }

  //sources=bbc-sport

 static Future<ArticlesResponse?> getArticles(String sourceId)async{
    try{
      var response = await dio.get("/v2/everything",queryParameters: {
        "apiKey":AppConstants.apiKey,
        "sources":sourceId,
      });
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
      return articlesResponse;
    }catch(e){
      print("Error : ${e.toString()}");
    }
 }

}