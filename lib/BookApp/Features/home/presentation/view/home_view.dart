import 'package:first_project/BookApp/Features/home/presentation/view/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import 'widgets/BestSellerListView.dart';
import 'widgets/FutureditemListView.dart';
import 'widgets/bestsellerViewlist.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customAppBar(),
              FutureditemListView(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Row(
                  children: [
                    Text(
                      'Best Seller',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: BestSellerView())
            ],
          ),
        ),
      ),
    );
  }
}
