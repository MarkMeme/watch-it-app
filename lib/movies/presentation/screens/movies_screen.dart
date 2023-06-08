import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it_app/core/services/services_locator.dart';
import 'package:watch_it_app/movies/presentation/components/popular_component.dart';
import 'package:watch_it_app/movies/presentation/components/top_rated_component.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_bloc.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_events.dart';

import '../components/my_cntainer_component.dart';
import '../components/now_playing_component.dart';

class MainMoviesScreen extends StatelessWidget {
  static const String routeName = 'MainMovieScreen';

  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc>()
        ..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMovieEvent()),
      child: Scaffold(
        backgroundColor: const Color(0xff1E1E1E),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              MyContainerComponent(title: 'Popular'),
              const PopularComponent(),
              MyContainerComponent(title: 'Top Rated'),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
