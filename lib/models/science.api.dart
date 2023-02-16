import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:orelit_assignment/models/news.dart';

class ScienceNewsApi {
  static Future<List<NewsModel>> getScienceNews() async {
    var dio = Dio();
    final response = await dio.get(
      "https://inshorts.deta.dev/news?category=science",
    );
    Map<String, dynamic> responseJson = json.decode(response.toString());
    List _temp = responseJson["data"];

    print(_temp.toString());
    return NewsModel.newsFromSnapshot(_temp);
  }
}
