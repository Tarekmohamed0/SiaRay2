import 'package:flutter/material.dart';

import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class Welcom extends StatelessWidget {
  const Welcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/200/300'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const AppText(
                          text: 'Trips',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        const AppText(
                          text: 'Mountain',
                          fontSize: 24,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: const AppText(
                            text:
                                'Mountain hikes give you an icredible sense of freedom along with endurance test',
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ResponsiveButton(
                          isresponsive: true,
                          width: 100,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
