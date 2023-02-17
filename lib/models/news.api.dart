import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:orelit_assignment/constants/api.dart';
import 'package:orelit_assignment/models/news.dart';

class NewsApi {
  static Future<List<NewsModel>> getNews(String newsType) async {
    var dio = Dio();
    final response = await dio.get(
      news_API + newsType,
    );
    Map<String, dynamic> responseJson = json.decode(response.toString());
    List _temp = responseJson["data"];

    return NewsModel.newsFromSnapshot(_temp);
  }
}
