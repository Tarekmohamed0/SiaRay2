import 'package:first_project/BookApp/Features/home/presentation/view/widgets/customListViewItem.dart';
import 'package:flutter/material.dart';

class FutureditemListView extends StatelessWidget {
  const FutureditemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return const customitemListView();
          }),
    );
  }
}
