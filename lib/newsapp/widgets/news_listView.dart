import 'package:first_project/newsapp/models/newsServices.dart';
import 'package:first_project/newsapp/models/newArticles.dart';
import 'package:first_project/newsapp/widgets/CustomShimmer.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../views/NewsContent.dart';

class NewsListview extends StatefulWidget {
  const NewsListview({super.key});

  @override
  State<NewsListview> createState() => _NewsListviewState();
}

class _NewsListviewState extends State<NewsListview> {
  List<NewsArticles> newsmodel = [];
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    fetchNews(); // Call the separate async method
  }

  // Separate async method to fetch news
  Future<void> fetchNews() async {
    newsmodel = await NewsServices().getnews();
    isloading = false;
    setState(() {}); // Update the state to refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsServices().getnews(),
        builder: (context, Snapshot) {
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: newsmodel.length, // Ensure newsmodel is not null
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Newscontent(newsArticles: newsmodel[index]);
                          }));
                        },
                        child: RepaintBoundary(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              newsmodel[index].image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsmodel[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsmodel[index].description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('publishedAt: ${newsmodel[index].publishedAt}'),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (Snapshot.connectionState == ConnectionState.none) {
            return CustomShimmerWithGlassEffect();
          } else if (Snapshot.connectionState == ConnectionState.done) {
            return Skeletonizer(
              enabled: isloading,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: newsmodel.length, // Ensure newsmodel is not null
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Newscontent(newsArticles: newsmodel[index]);
                          }));
                        },
                        child: RepaintBoundary(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              newsmodel[index].image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsmodel[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsmodel[index].description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('publishedAt: ${newsmodel[index].publishedAt}'),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        });
  }
}
