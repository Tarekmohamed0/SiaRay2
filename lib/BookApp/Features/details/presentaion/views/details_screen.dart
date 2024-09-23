import 'package:first_project/BookApp/Features/details/presentaion/views/widgets/alsoLikeListView.dart';
import 'package:first_project/BookApp/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.cancel_sharp,
                    size: 20,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('The Jungle Book'),
            const SizedBox(
              height: 2,
            ),
            const Text('Rudyard Kipling'),
            const SizedBox(
              height: 2,
            ),
            const Text('4.8 (2390)'),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          r'19.99 $',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'free preview',
                          style: AppTextStyle.textstyle15
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'You can also like',
                    style: AppTextStyle.textstyle15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Alsolikelistview()
          ],
        ),
      ),
    );
  }
}
