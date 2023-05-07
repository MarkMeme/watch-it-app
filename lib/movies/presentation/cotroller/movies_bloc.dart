import 'package:bloc/bloc.dart';
import 'package:watch_it_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_events.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_states.dart';

import '../../data/repository/movie_repo.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  MoviesBloc() : super(const MoviesStates()) {
    on<GetNowPlayingMovieEvent>((event, emit) {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepo baseMovieRepo = MovieRepo(baseMovieRemoteDataSource);
      final result =
          GetNowPlayingUseCse(baseMovieRepo: baseMovieRepo).execute();
      print(result);
    });
  }
}
