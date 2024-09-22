import 'package:first_project/BookApp/Features/splash/presentation/views/widgets/slidingtexttoleft.dart';
import 'package:first_project/BookApp/Features/splash/presentation/views/widgets/slidingtexttoright.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/view/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;
  late Animation<Offset> slidinganimationtoleft;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animateto();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          // color: AppColor.purple,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          slidingtextToleft(slidinganimationtoleft: slidinganimationtoleft),
          const SizedBox(
            height: 20,
          ),
          slidingtextToright(slidinganimation: slidinganimation),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomeView();
              }));
            },
            backgroundColor: Colors.purple,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  void animateto() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidinganimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
            .animate(animationController);
    slidinganimationtoleft =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
