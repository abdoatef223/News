import 'package:dio/dio.dart';
import 'package:news_c19/core/resources/app_constants.dart';
import 'package:news_c19/model/articles_response/Articles_response.dart';
import 'package:news_c19/model/sources_response/Sources_response.dart';

class ApiManager{
  static Dio dio = Dio(BaseOptions(
    baseUrl: "https://newsapi.org",
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  ));
  static Future<SourcesResponse?> getSources(String category)async{
    try{
      var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
        "apiKey":AppConstants.apiKey,
        "category":category
      });
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse;
    }catch(e){
      print("getSources error: ${e.toString()}");
      return SourcesResponse.fromJson({"status": "error", "message": e.toString()});
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
      print("getArticles error : ${e.toString()}");
      return ArticlesResponse.fromJson({"status": "error", "message": e.toString()});
    }
  }


  static Future<ArticlesResponse?> searchArticles(String query) async {
    try {
      var response = await dio.get("/v2/everything", queryParameters: {
        "apiKey": AppConstants.apiKey,
        "q": query,
        "sortBy": "popularity",
      });
      print("searchArticles response: ${response.data}");
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
      return articlesResponse;
    } catch (e) {
      print("searchArticles error : ${e.toString()}");
      return ArticlesResponse.fromJson({"status": "error", "message": e.toString()});
    }
  }

}