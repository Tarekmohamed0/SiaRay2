import 'package:flutter/material.dart';

import '../../data/models/animatoinModel.dart';

class Newanimation extends StatefulWidget {
  const Newanimation({super.key});

  @override
  State<Newanimation> createState() => _NewanimationState();
}

class _NewanimationState extends State<Newanimation> {
  final ScrollController scrollController = ScrollController();
  final double itemSize = 150.0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose(); // Always dispose of your controllers.
    super.dispose();
  }

  void _onScroll() {
    print('scrollController offset is ${scrollController.offset}');
    setState(() {}); // Trigger a rebuild to apply changes based on scroll.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Newanimation'),
        ),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final character = animationmodel[index];
                  final itemPositionOffset = index * itemSize;
                  final difference = scrollController.offset - itemPositionOffset;
                  final percent = 1 - (difference / itemSize);
                  double scale = percent;
                  if (scale > 1.0) {
                    scale = 1.0;
                  } else if (scale < 0.0) {
                    scale = 0.0;
                  }
                  // Clamp opacity between 0 and 1
                  double opacity = percent.clamp(0.0, 1.0);

                  return Align(
                    heightFactor: 1.0,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                         ..scale(scale,1.0), // Rotate item
                        child: Card(
                          color: Colors.red,
                          child: SizedBox(
                            height: itemSize,
                            child: Row(
                              children: <Widget>[
                                Text(character.title),
                                Image.network(
                                  character.image,
                                  scale: 2.5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: animationmodel.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
