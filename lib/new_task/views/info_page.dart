import 'package:first_project/new_task/models/famous_model.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add To Favoriet',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue,
              ),
              height: 200,
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    '${famous[indexx].name}',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Text(
                    '${famous[indexx].address}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

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
int indexx = 0;
int index() {
  // ignore: dead_code
  for (int i = 0; i < famous.length; i++) {
    indexx = i;
    return indexx;
  }
  return 0;
}
