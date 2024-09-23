import 'package:dio/dio.dart';
import 'package:first_project/twitter/TweetsArticles.dart';

class Tweet {
  String image;
  String name;
  String username;
  String time;
  String tweet;
  String comments;
  int likes;
  int shares;
  int views;

  Tweet({
    required this.image,
    required this.name,
    required this.username,
    required this.time,
    required this.tweet,
    required this.comments,
    required this.likes,
    required this.shares,
    required this.views,
  });
}

final List<Tweet> tweets = <Tweet>[
  Tweet(
    image: 'https://picsum.photos/250/250',
    name: 'John Doe',
    username: '@johndoe',
    time: '2h',
    tweet:
        'This is a tweet from John Doe and it is a very long tweet that will be cut off at some point because it is too long',
    comments: '2',
    likes: 5,
    shares: 3,
    views: 10,
  ),
  Tweet(
    // get link for image tweets for twitter  from https://www.pngarts.com/
    image: 'https://picsum.photos/250/250',
    name: 'Jane Doe',
    username: '@janedoe',
    time: '3h',
    tweet:
        'This is a tweet from John Doe and it is a very long tweet that will be cut off at some point because it is too long',
    comments: '3',
    likes: 10,
    shares: 5,
    views: 20,
  ),
  Tweet(
    image: 'https://picsum.photos/250/250',
    name: 'John Smith',
    username: '@johnsmith',
    time: '4h',
    tweet:
        'This is a tweet from John Doe and it is a very long tweet that will be cut off at some point because it is too long',
    comments: '4',
    likes: 15,
    shares: 7,
    views: 30,
  ),

  // Tweet(
  //   image: 'https://www.pngarts.com/files/3/Avatar-Transparent-Image.png',
  //   name: 'Jane Smith',
  //   username: '@janesmith',
  //   time: '5h',
  //   tweet: 'This is another tweet',
  //   comments: '5',
  //   likes: 20,
  //   shares: 10,
  //   views: 40,
  // ),

  Tweet(
    image: 'https://picsum.photos/250/250',
    name: 'John Doe',
    username: '@johndoe',
    time: '2h',
    tweet:
        'This is a tweet from John Doe and it is a very long tweet that will be cut off at some point because it is too long',
    comments: '2',
    likes: 5,
    shares: 3,
    views: 10,
  )
];

class TweetServices {
  final String? image;
  final String? title;
  final String? description;
  final String? publishedAt;

  TweetServices({
    this.image,
    this.title,
    this.description,
    this.publishedAt,
  });

  Future<List<Tweetsarticles>> getweets() async {
    Dio dio = Dio();
    var response = await dio.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-08-01&sortBy=publishedAt&apiKey=3f20c98f95c848adb3db53d8529d8214');
    Map<String, dynamic> jsondata = response.data;

    List<dynamic> articles = jsondata['articles'];
    List<Tweetsarticles> articlesList = [];

    // Corrected List Initialization
    List<TweetServices> tweets = [
      for (var article in articles)
        TweetServices(
          image: article['urlToImage'] ?? '', // Handle null values
          title: article['title'] ?? '',
          description: article['description'] ?? '',
          publishedAt: article['publishedAt'] ?? '',
        ),
    ];

    // Loop through the `news` list and add items to `articlesList`
    for (var tweetarticles in tweets) {
      articlesList.add(Tweetsarticles(
        title: tweetarticles.title ?? '', // Handle null values
        description: tweetarticles.description ?? '',
        image: tweetarticles.image ?? '',
        publishedAt: tweetarticles.publishedAt ?? '',
      ));
    }

    return articlesList;
  }
}
