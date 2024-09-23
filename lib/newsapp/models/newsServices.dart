// import 'package:dio/dio.dart';
// import 'package:first_project/newsapp/src/features/news_listview/data/models/newArticles.dart';

import 'package:dio/dio.dart';
import 'package:first_project/newsapp/models/newArticles.dart';

class NewsServices {
  final String? image;
  final String? title;
  final String? description;
  final String? publishedAt;

  NewsServices({
    this.image,
    this.title,
    this.description,
    this.publishedAt,
  });

  Future<List<NewsArticles>> getnews() async {
    Dio dio = Dio();
    var response = await dio.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-08-01&sortBy=publishedAt&apiKey=3f20c98f95c848adb3db53d8529d8214');
    Map<String, dynamic> jsondata = response.data;

    List<dynamic> articles = jsondata['articles'];
    List<NewsArticles> articlesList = [];

    // Corrected List Initialization
    List<NewsServices> news = [
      for (var article in articles)
        NewsServices(
          image: article['urlToImage'] ?? '', // Handle null values
          title: article['title'] ?? '',
          description: article['description'] ?? '',
          publishedAt: article['publishedAt'] ?? '',
        ),
    ];

    // Loop through the `news` list and add items to `articlesList`
    for (var newsService in news) {
      articlesList.add(NewsArticles(
        title: newsService.title ?? '', // Handle null values
        description: newsService.description ?? '',
        image: newsService.image ?? '',
        publishedAt: newsService.publishedAt ?? '',
      ));
    }

    return articlesList;
  }
  // this is a factory method to convert the json data to the model

  factory NewsServices.fromJson(Map<String, dynamic> json) {
    return NewsServices(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      publishedAt: json['publishedAt'],
    );
  }
}
