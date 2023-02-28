import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/article.dart';


class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {

    /*final queryParameters = {
      'country': 'us',
      'category': 'business',
      'apiKey': '3bc12facdff148f38f0fbb4599cfedd1'
    };*/
    final uri = Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=3bc12facdff148f38f0fbb4599cfedd1");
    final response = await client.get(uri);

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}