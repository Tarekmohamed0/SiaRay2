import 'package:first_project/twitter/constraints.dart';
import 'package:first_project/twitter/x_home.dart';
import 'package:flutter/material.dart';

class XBottomNavBar extends StatefulWidget {
  const XBottomNavBar({super.key});

  @override
  State<XBottomNavBar> createState() => _XBottomNavBarState();
}

class _XBottomNavBarState extends State<XBottomNavBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      const Xhome(),
      navBarPage(Icons.search),
      navBarPage(Icons.notifications),
      navBarPage(Icons.grid_view),
      navBarPage(Icons.mail),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0x0ff00000),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) => setState(() => selectedIndex = index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.white,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 25,
                  ),
                  label: 'search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.feed,
                    size: 25,
                  ),
                  label: 'feed'),
            ]),
        body: page[selectedIndex],
      ),
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(iconName, size: 150, color: Colors.white),
    );
  }
}
