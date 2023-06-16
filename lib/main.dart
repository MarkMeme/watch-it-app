import 'package:flutter/material.dart';
import 'package:watch_it_app/movies/presentation/screens/movies_screen.dart';

import 'core/services/services_locator.dart';
import 'movies/presentation/screens/swiping.dart';
import 'movies/presentation/screens/test_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SwipingScreens.routeName,
      routes: {
        MainMoviesScreen.routeName: (context) => const MainMoviesScreen(),
        TestScreen.routeName: (context) => TestScreen(),
        SwipingScreens.routeName: (context) => SwipingScreens()
      },
    );
  }
}
