import 'package:equatable/equatable.dart';
import 'package:watch_it_app/core/utils/request_states.dart';

import '../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final RequestState nowPlayingState;

  final List<Movie> nowPlayingMovies;

  final String message;

  const MoviesStates(
      {this.nowPlayingState = RequestState.loading,
      this.nowPlayingMovies = const [],
      this.message = ""});

  @override
  List<Object> get props => [nowPlayingState, nowPlayingMovies, message];
}
