import 'package:flutter/material.dart';
import 'package:watch_it_app/movies/presentation/screens/movies_screen.dart';
import 'package:watch_it_app/movies/presentation/screens/popular_movies_screen.dart';
import 'package:watch_it_app/movies/presentation/screens/top_rated_screen.dart';

import 'core/services/services_locator.dart';

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
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: MainMoviesScreen.routeName,
      routes: {
        PopularMoviesScreen.routeName: (context) => const PopularMoviesScreen(),
        TopRatedScreen.routeName: (context) => const TopRatedScreen(),
        MainMoviesScreen.routeName: (context) => const MainMoviesScreen(),
      },
    );
  }
}
