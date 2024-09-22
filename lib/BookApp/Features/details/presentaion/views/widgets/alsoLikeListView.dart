import 'package:first_project/BookApp/Features/details/presentaion/views/widgets/alsoLikeItemView.dart';
import 'package:flutter/material.dart';

class Alsolikelistview extends StatelessWidget {
  const Alsolikelistview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Alsolikeitemview();
          }),
    );
  }
}
