// import 'package:dio/dio.dart';

class NewsModel {
  String title;
  String description;
  String url;

  String publishedAt;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.publishedAt,
  });

  // factory NewsModel.fromJson(Map<String, dynamic> json) {
  //   return NewsModel(
  //     title: json['title'],
  //     description: json['description'],
  //     url: json['url'],
  //     urlToImage: json['urlToImage'],
  //     publishedAt: json['publishedAt'],
  //   );
  // }
}

List<NewsModel> newsmodel = [
  NewsModel(
      title: 'testjljsdljfsljdflsadlfj',
      description: 'asdfjlskdjfasdfjlskdjflksjdfasdfsadfsfsalksjdfasdfsadfsfsa',
      url: 'https://picsum.photos/250/250',
      publishedAt: '2021-10-14T00:00:00Z'),
  NewsModel(
      title: 'testjljsdljfsljdflsadlfj',
      description: 'asdfjlskdjfasdfjlskdjflksjdfasdfsadfsfsalksjdfasdfsadfsfsa',
      url: 'https://picsum.photos/250/250',
      publishedAt: '2021-10-14T00:00:00Z'),
  NewsModel(
      title: 'testjljsdljfsljdflsadlfj',
      description: 'asdfjlskdjfasdfjlskdjflksjdfasdfsadfsfsalksjdfasdfsadfsfsa',
      url: 'https://picsum.photos/250/250',
      publishedAt: '2021-10-14T00:00:00Z'),
  NewsModel(
      title: 'testjljsdljfsljdflsadlfj',
      description: 'asdfjlskdjfasdfjlskdjflksjdfasdfsadfsfsalksjdfasdfsadfsfsa',
      url: 'https://picsum.photos/250/250',
      publishedAt: '2021-10-14T00:00:00Z'),
];
