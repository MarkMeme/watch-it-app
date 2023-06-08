import 'package:bloc/bloc.dart';
import 'package:watch_it_app/core/services/services_locator.dart';
import 'package:watch_it_app/core/utils/request_states.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_events.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingUseCse getNowPlayingUseCse;
  final GetPopularMoviesUseCse getPopularMoviesUseCse;
  final GetTopRatedMoviesUseCse getTopRatedMoviesUseCse;

  MoviesBloc(this.getNowPlayingUseCse, this.getPopularMoviesUseCse,
      this.getTopRatedMoviesUseCse)
      : super(const MoviesStates()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      final result =
          await GetNowPlayingUseCse(baseMovieRepo: getIt()).execute();
      emit(state.copyWith(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(
          state.copyWith(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r),
        ),
      );
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result =
          await GetPopularMoviesUseCse(baseMovieRepo: getIt()).execute();
      emit(state.copyWith(popularState: RequestState.loaded));
      result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)),
      );
    });
    on<GetTopRatedMovieEvent>((event, emit) async {
      final result =
          await GetTopRatedMoviesUseCse(baseMovieRepo: getIt()).execute();
      emit(state.copyWith(topRatedState: RequestState.loaded));
      result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: r)),
      );
    });
  }
}
