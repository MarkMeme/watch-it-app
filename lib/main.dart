import 'package:flutter/material.dart';
import 'package:watch_it_app/movies/presentation/screens/movie_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MoviesHomeScreen.routeName,
      routes: {MoviesHomeScreen.routeName: (context) => MoviesHomeScreen()},
    );
  }
}
