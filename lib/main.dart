import 'package:first_project/twitter/constraints.dart';
import 'package:first_project/twitter/x_home.dart';
import 'package:first_project/twitter/xbottomnavbar.dart';
import 'package:flutter/material.dart';
import 'text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'First Project',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: backgroundColor,
          ),
          scaffoldBackgroundColor: backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home: XBottomNavBar()

        // Scaffold(
        //   appBar: AppBar(
        //     title: Text(
        //       'this is first app',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     leading: Icon(Icons.menu),
        //     actions: [
        //       IconButton(
        //         icon: Icon(Icons.search),
        //         onPressed: () {
        //           print('search');
        //         },
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.more_vert),
        //         onPressed: () {
        //           print('more');
        //         },
        //       ),
        //     ],
        //   ),
        //   body: Center(
        //     // this column takes the whole screen high
        //     // of the scaffold by default
        //     // and he set its children in the center
        //     child: Column(
        //       // this mainAxisAlignment is for the children
        //       // of the column to be aligned in the center
        //       // in the main axis which is vertical بالطول
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       // this crossAxisAlignment is for the children
        //       // of the column to be aligned in the center
        //       // in the cross axis which is horizontal بالعرض
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       children: [
        //         Container(
        //             decoration: BoxDecoration(
        //               color: Colors.blue,
        //               borderRadius: BorderRadius.circular(5),
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey,
        //                   // this argument is for blur radius
        //                   // this is for how much blur you want
        //                   blurRadius: 15,
        //                   // this argument is for blur style
        //                   // to determine the blur style
        //                   blurStyle: BlurStyle.normal,
        //                   // this offset is for shadow to be shown on right and bottom side
        //                   // you can change it to -5, -5 to show shadow on left and top side
        //                   offset: Offset(5, 5),
        //                 ),
        //               ],
        //             ),
        //             margin: EdgeInsets.all(10),
        //             padding: EdgeInsets.all(10),
        //             width: double.infinity,
        //             height: 60,
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Icon(Icons.home),
        //                 Row(
        //                   children: [
        //                     Icon(Icons.home_max),
        //                     Padding(padding: EdgeInsets.all(10)),
        //                     Text(
        //                       'Home',
        //                       style: TextStyle(
        //                           color: Colors.black,
        //                           fontWeight: FontWeight.bold),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             )),
        //         Container(
        //           child: Row(
        //             children: [
        //               Padding(padding: EdgeInsets.all(10)),
        //               Container(
        //                 width: 50,
        //                 height: 50,
        //                 decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(50),
        //                   shape: BoxShape.rectangle,
        //                 ),
        //                 child: Image(
        //                     image: NetworkImage('https://picsum.photos/250/250',
        //                         scale: 1.5),
        //                     fit: BoxFit.fill),
        //               ),
        //               Padding(padding: EdgeInsets.only(top: 10, left: 10)),
        //               Container(
        //                 width: 50,
        //                 height: 50,
        //                 decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                     image: NetworkImage('https://picsum.photos/250/250',
        //                         scale: 1.5),
        //                     fit: BoxFit.fill,
        //                   ),
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(50),
        //                   shape: BoxShape.rectangle,
        //                 ),
        //               ),
        //               // this clipRRect is for the image to be shown in a circle
        //               ClipRRect(
        //                 borderRadius: BorderRadius.circular(500),
        //                 child: Image(
        //                   image: NetworkImage('https://picsum.photos/250/250',
        //                       // this scale is for the image quality and size
        //                       scale: 1.0),
        //                   // this fit is for how the image will be shown
        //                   // in the container
        //                   fit: BoxFit.fill,
        //                   width: 250,
        //                   height: 250,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ));
        );
  }
}
