import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test_task/models/article.dart';
import 'package:http/http.dart' as http;
import '../models/instrument.dart';
import '../utils/util.dart';

class ApiService {
  final endPointUrl = "lightyear.ee";
  final client = http.Client();

  Future<List<Instrument>> getInstruments() async {
    final uri = Uri.https(endPointUrl, '/api/v1/instrument');
    final response = await client.get(uri);
    List<dynamic> body = jsonDecode(response.body);
    List<Instrument> instruments = body.map((dynamic item) => Instrument.fromJson(item)).toList();
    return instruments;
  }

  Future<List<Article>> getArticles() async {
    final String response = await rootBundle.loadString('./data/news.json');
    List<dynamic> body = jsonDecode(response);
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    Util.sortArticlesByPublishTime(articles);
    return articles;
  }
}