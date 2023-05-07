import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_bloc.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_events.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_states.dart';

class MoviesHomeScreen extends StatelessWidget {
  static const String routeName = 'moviesHomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc()..add(GetNowPlayingMovieEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (context, state) {
          print(state);
          return Scaffold();
        },
      ),
    );
  }
}
