import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/news_model.dart';

class NewsListRepository {
  Future<List<NewsModel>> getNewsList() async {
    final response = await Dio().get("http://192.168.50.4:8080/news");
    debugPrint(response.toString());
    final data =  response.data as List<dynamic>;
    final dataNews = data.map((e) => NewsModel.fromJson(e)).toList().reversed.toList();
    debugPrint(dataNews.toString());
    return dataNews;
  }
}
