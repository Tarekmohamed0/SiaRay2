import 'package:first_project/newsapp/models/newArticles.dart';
import 'package:flutter/material.dart';

import '../models/newsServices.dart';

class Newscontent extends StatefulWidget {
  const Newscontent({super.key, required this.newsArticles});
  final NewsArticles newsArticles;

  @override
  State<Newscontent> createState() => _NewscontentState();
}

class _NewscontentState extends State<Newscontent> {
  List<NewsArticles> news2 = [];
  Future<void> lop() async {
    news2 = await NewsServices().getnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newscontent'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.newsArticles.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.newsArticles.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.newsArticles.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Future<int> lop() async{
//  final news3 = await NewsServices().getnews();
//  for (int i = 0; i < news3.length; i++) {
//     return i;
//   }
//   return 0;
// }
//
// final indexx = lop();
//
//

