import 'package:first_project/BookApp/Features/home/presentation/view/widgets/BestSellerListView.dart';
import 'package:flutter/material.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const BestSellerListView();
        });
  }
}
