// import 'package:first_project/Doctor_app/Doc_app.dart';
// import 'package:first_project/Project_withAnimation/presentation/pages/NewAnimation.dart';
import 'package:first_project/BookApp/Features/home/presentation/view/home_view.dart';
import 'package:first_project/chatapp/blocs/bloc_observer.dart';
import 'package:first_project/chatapp/features/login/presentation/cubit/login_cubit.dart';
import 'package:first_project/famous_person/feauters/detailsScreen/cubit/Person_details_cubit.dart';
import 'package:first_project/famous_person/feauters/home/cubit/famous_person_cubit.dart';
import 'package:first_project/famous_person/feauters/home/services/api_services.dart';
import 'package:first_project/new_task/views/home_page.dart';
import 'package:first_project/new_task/views/info_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:first_project/counterapp/counterapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
// import 'chatapp/features/chat/presentation/pages/caht_screen.dart';
// import 'chatapp/core/routes/names.dart';
import 'chatapp/features/chat/presentation/pages/caht_screen.dart';
import 'chatapp/features/register/presentation/pages/register_screen.dart';
import 'famous_person/core/routes/names.dart';
import 'famous_person/feauters/detailsScreen/screens/details_screen.dart';
import 'famous_person/feauters/home/screens/home_scren.dart';
import 'firebase_options.dart';
// import 'package:first_project/tokuapp/tokuapp.dart';
// import 'package:first_project/chatapp/core/routes/routes.dart';
import 'package:first_project/chatapp/features/login/presentation/pages/login_screen.dart';
// import 'package:first_project/chatapp/features/register/presentation/pages/register_screen.dart';

// import 'package:first_project/master%20bloc/pages/welcom.dart';
import 'package:first_project/twitter/constraints.dart';
// import 'package:first_project/twitter/x_home.dart';
// import 'package:first_project/twitter/xbottomnavbar.dart';
import 'package:first_project/weatherApp/cubits/get_current_weather_cubit/get_weather_cubit.dart';
// import 'package:first_project/weatherApp/presentation/pages/searchScreen.dart';
// import 'package:first_project/weatherApp/presentation/pages/weatherHome.dart';
// import 'package:first_project/twitter/x_home.dart';
// import 'package:first_project/twitter/xbottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:first_project/storeapp/core/routes/routes.dart';
// import 'chatapp/features/register/presentation/pages/register_screen.dart';
import 'notesapp/cubit/add_notes/notes_cubit.dart';
import 'notesapp/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'notesapp/view/home.dart';
import 'notesapp/view/notes_model.dart';
// import 'storeapp/features/product/presentation/pages/home.dart';
// import 'storeapp/features/product/presentation/pages/update_product.dart';

// import 'newsapp/views/news_home.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'Project_withAnimation/presentation/pages/homePage.dart';
// import 'text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox('notes');
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

  // DocApp(
  // appRouter: AppRouter(),
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String phone = '01000000000';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider<GetWeatherCubit>(
          create: (context) => GetWeatherCubit(),
        ),
        BlocProvider<NotesCubitCubit>(
          create: (context) => NotesCubitCubit(),
        ),
        BlocProvider<FamousPersonCubit>(
          create: (context) => FamousPersonCubit(),
        ),
        BlocProvider<PersonDetailsCubit>(
          create: (context) => PersonDetailsCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: {
        //   '/login': (context) => LoginScreen(),
        //   '/register': (context) => RegisterScreen(),
        //   '/news': (context) => NewsHome(),
        // },
        routes: {
          // RoutesName.login: (context) => LoginScreen(),
          // RoutesName.register: (context) => RegisterScreen(),
          // RoutesName.chat: (context) => CahtScreen(),
          RoutesName.details: (context) => DetailsScreen(),
          // RoutesName.home: (context) => HomeProduct(),
          // RoutesName.updateProduct: (context) => UpdateProduct(),
        },
        title: 'First Project',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: backgroundColor,
          ),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home: HomeScren(),

        // XBottomNavBar()

        //   Scaffold(
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text(
        //     'this is first app',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   leading: Icon(Icons.menu),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.search),
        //       onPressed: () {
        //         print('search');
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.more_vert),
        //       onPressed: () {
        //         print('more');
        //       },
        //     ),
        //   ],
        // ),
        // body: Center(
        //   // this column takes the whole screen high
        //   // of the scaffold by default
        //   // and he set its children in the center
        //   child: Column(
        //     // this mainAxisAlignment is for the children
        //     // of the column to be aligned in the center
        //     // in the main axis which is vertical بالطول
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     // this crossAxisAlignment is for the children
        //     // of the column to be aligned in the center
        //     // in the cross axis which is horizontal بالعرض
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Container(
        //           decoration: BoxDecoration(
        //             color: Colors.blue,
        //             borderRadius: BorderRadius.circular(5),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.grey,
        //                 // this argument is for blur radius
        //                 // this is for how much blur you want
        //                 blurRadius: 15,
        //                 // this argument is for blur style
        //                 // to determine the blur style
        //                 blurStyle: BlurStyle.normal,
        //                 // this offset is for shadow to be shown on right and bottom side
        //                 // you can change it to -5, -5 to show shadow on left and top side
        //                 offset: Offset(5, 5),
        //               ),
        //             ],
        //           ),
        //           margin: EdgeInsets.all(10),
        //           padding: EdgeInsets.all(10),
        //           width: double.infinity,
        //           height: 60,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Icon(Icons.home),
        //               Row(
        //                 children: [
        //                   Icon(Icons.home_max),
        //                   Padding(padding: EdgeInsets.all(10)),
        //                   Text(
        //                     'Home',
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           )),
        //       Container(
        //         child: Row(
        //           children: [
        //             Padding(padding: EdgeInsets.all(10)),
        //             Container(
        //               width: 50,
        //               height: 50,
        //               decoration: BoxDecoration(
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.circular(50),
        //                 shape: BoxShape.rectangle,
        //               ),
        //               child: Image(
        //                   image: NetworkImage('https://picsum.photos/250/250',
        //                       scale: 1.5),
        //                   fit: BoxFit.fill),
        //             ),
        //             Padding(padding: EdgeInsets.only(top: 10, left: 10)),
        //             Container(
        //               width: 50,
        //               height: 50,
        //               decoration: BoxDecoration(
        //                 image: DecorationImage(
        //                   image: NetworkImage('https://picsum.photos/250/250',
        //                       scale: 1.5),
        //                   fit: BoxFit.fill,
        //                 ),
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.circular(50),
        //                 shape: BoxShape.rectangle,
        //               ),
        //             ),
        //             // this clipRRect is for the image to be shown in a circle
        //             ClipRRect(
        //               borderRadius: BorderRadius.circular(500),
        //               child: Image(
        //                 image: NetworkImage('https://picsum.photos/250/250',
        //                     // this scale is for the image quality and size
        //                     scale: 1.0),
        //                 // this fit is for how the image will be shown
        //                 // in the container
        //                 fit: BoxFit.fill,
        //                 width: 250,
        //                 height: 250,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Center(
        //         child: Container(
        //           width: 350,
        //           height: 100,
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //             borderRadius: BorderRadius.circular(10),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.grey,
        //                 blurRadius: 15,
        //                 blurStyle: BlurStyle.normal,
        //                 offset: Offset(5, 5),
        //               ),
        //             ],
        //             border: Border.all(
        //               color: Colors.black,
        //               width: 2,
        //             ),
        //           ),
        //           child: Center(
        //               child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               Icon(
        //                 Icons.phone,
        //                 color: Colors.white,
        //                 size: 32,
        //                 shadows: [
        //                   Shadow(
        //                       color: Colors.black,
        //                       blurRadius: 5,
        //                       offset: Offset(6, 3))
        //                 ],
        //               ),
        //               Padding(padding: EdgeInsets.all(10)),
        //               Text(
        //                 '+2${phone}',
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 20,
        //                     shadows: [
        //                       Shadow(
        //                           color: Colors.black,
        //                           blurRadius: 5,
        //                           offset: Offset(6, 3))
        //                     ]),
        //               ),
        //             ],
        //           )),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Center(
        //         child: Container(
        //           width: 350,
        //           height: 100,
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //             borderRadius: BorderRadius.circular(10),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.grey,
        //                 blurRadius: 15,
        //                 blurStyle: BlurStyle.normal,
        //                 offset: Offset(5, 5),
        //               ),
        //             ],
        //             border: Border.all(
        //               color: Colors.black,
        //               width: 2,
        //             ),
        //           ),
        //           child: Center(
        //               child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               Icon(
        //                 Icons.phone,
        //                 color: Colors.white,
        //                 size: 32,
        //                 shadows: [
        //                   Shadow(
        //                       color: Colors.black,
        //                       blurRadius: 5,
        //                       offset: Offset(6, 3))
        //                 ],
        //               ),
        //               Padding(padding: EdgeInsets.all(10)),
        //               Text(
        //                 '+2${phone}',
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 20,
        //                     shadows: [
        //                       Shadow(
        //                           color: Colors.black,
        //                           blurRadius: 5,
        //                           offset: Offset(6, 3))
        //                     ]),
        //               ),
        //             ],
        //           )),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // ),
      ),
    );
  }
}
