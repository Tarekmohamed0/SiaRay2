import 'package:first_project/newsapp/models/news_model.dart';
import 'package:flutter/material.dart';

class Categorycart extends StatelessWidget {
  const Categorycart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsmodel.length, // Ensure newsmodel is not null
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(newsmodel[index].url),
                  fit: BoxFit.cover,
                  scale: 2.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
          );
        },
      ),
    );
  }
}
