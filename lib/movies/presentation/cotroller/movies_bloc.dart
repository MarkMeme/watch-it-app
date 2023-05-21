import 'package:bloc/bloc.dart';
import 'package:watch_it_app/core/services/services_locator.dart';
import 'package:watch_it_app/core/utils/request_states.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_events.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingUseCse getNowPlayingUseCse;

  MoviesBloc({required this.getNowPlayingUseCse})
      : super(const MoviesStates()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      final result =
          await GetNowPlayingUseCse(baseMovieRepo: getIt()).execute();
      emit(const MoviesStates(nowPlayingState: RequestState.loaded));
      print(result);
      result.fold(
        (l) => emit(MoviesStates(
            nowPlayingState: RequestState.error, message: l.message)),
        (r) => emit(
          MoviesStates(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r),
        ),
      );
    });
  }
}
