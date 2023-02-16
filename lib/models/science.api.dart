import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:orelit_assignment/models/news.dart';

class ScienceNewsApi {
  static Future<List<NewsModel>> getScienceNews(String newsType) async {
    var dio = Dio();
    final response = await dio.get(
      "https://inshorts.deta.dev/news?category=" + newsType,
    );
    Map<String, dynamic> responseJson = json.decode(response.toString());
    List _temp = responseJson["data"];

    return NewsModel.newsFromSnapshot(_temp);
  }
}
