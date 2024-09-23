import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:slide_to_act/slide_to_act.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slidable(
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    borderRadius: BorderRadius.circular(6),
                    icon: Icons.phone,
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    borderRadius: BorderRadius.circular(6),
                    icon: Icons.message,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              child: Container(
                child: const ListTile(
                  title: Text('tarek mohamed'),
                  subtitle: Text('+201023453224'),
                  leading: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  leadingAndTrailingTextStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlideAction(
                sliderRotate: false,
                borderRadius: 6,
                onSubmit: () {
                  print('submit');
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
