import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/newsModel.dart';

class NewsProvider extends ChangeNotifier {
  List<Articles> articles = [];

  var apiKey = "82d378efc8d241eebc7afa9b3b57f50a";

  Future<void> getNewsList() async {
    var url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var r = json.decode(response.body);
    NewsModel model = NewsModel.fromJson(r);
    articles = model.articles;
    notifyListeners();
  }
}
