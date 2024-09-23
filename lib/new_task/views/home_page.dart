import 'package:first_project/new_task/views/info_page.dart';
import 'package:flutter/material.dart';

import '../models/famous_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<FamousModel> famous = [
      FamousModel(id: '1', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '2', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '3', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '4', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '5', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '6', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '7', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '8', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '9', name: 'alex', address: 'new york', image: ''),
      FamousModel(id: '10', name: 'alex', address: 'new york', image: ''),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("list of famous"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    settings: RouteSettings(arguments: famous),
                    builder: (context) {
                      return InfoPage();
                    }));
              },
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue),
                height: 200,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'alex',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
