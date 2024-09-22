import 'package:first_project/newsapp/models/news_model.dart';
import 'package:first_project/newsapp/widgets/category.dart';
import 'package:first_project/newsapp/widgets/news_listView.dart';
// import 'package:first_project/tokuapp/components/category.dart';
import 'package:flutter/material.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'newsapp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title:
                const Text('newsapp', style: TextStyle(color: Colors.yellow)),
            backgroundColor: Colors.white,
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Categorycart(),
                Expanded(child: NewsListview()),
              ],
            ),
          ),
        )

        // Add a fixed height here or another SingleChildScrollView if needed
        );
  }
}
