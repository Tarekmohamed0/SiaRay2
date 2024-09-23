import 'package:first_project/tokuapp/components/category.dart';
import 'package:first_project/tokuapp/extentions/extentions.dart';
import 'package:first_project/tokuapp/screens/NumbersPage.dart';
import 'package:flutter/material.dart';

class Tokuhome extends StatelessWidget {
  const Tokuhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tokuapp'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Category(
            title: 'Toku',
            color: Colors.brown,
            ontap: () {
              // extension method navigateTo is called here
              // from the context object of BuildContext
              // which is passed as an argument to the build method of this widget
              // and the Numberspage widget is passed as an argument to the navigateTo method
              context.navigateTo(Numberspage());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Category(
              title: 'Numbers',
              color: Colors.green,
              ontap: () {
                context.navigateTo(Numberspage());
              }),
          const SizedBox(
            height: 20,
          ),
          Category(
              title: 'family members',
              color: Colors.orange,
              ontap: () {
                context.navigateTo(Numberspage());
              }),
          const SizedBox(
            height: 20,
          ),
          Category(
              title: 'colors',
              color: Colors.purple,
              ontap: () {
                context.navigateTo(Numberspage());
              }),
          const SizedBox(
            height: 20,
          ),
          Category(
              title: 'pharses',
              color: Colors.blue,
              ontap: () {
                context.navigateTo(Numberspage());
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
