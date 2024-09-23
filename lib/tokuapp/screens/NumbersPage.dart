import 'package:first_project/tokuapp/components/Numbers_categorry.dart';
import 'package:flutter/material.dart';
import 'package:first_project/tokuapp/models/numbers.dart';

class Numberspage extends StatelessWidget {
  const Numberspage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
            size: 30,
          ),
        ),
        title: const Text('Numbers'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return NumbersCategorry(
                image: numbers[index].image,
                enumber: numbers[index].enumber,
                jpnumber: numbers[index].jpnumber,
              );
            },
          ),
        ),
      ),
    );
  }
}
