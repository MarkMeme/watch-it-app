import 'package:equatable/equatable.dart';
import 'package:watch_it_app/core/utils/request_states.dart';

import '../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final RequestState nowPlayingState;
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState popularState;
  final List<Movie> popularMovies;
  final String popularMessage;
  final RequestState topRatedState;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;

  MoviesStates copyWith({
    RequestState? nowPlayingState,
    List<Movie>? nowPlayingMovies,
    String? nowPlayingMessage,
    RequestState? popularState,
    List<Movie>? popularMovies,
    String? popularMessage,
    RequestState? topRatedState,
    List<Movie>? topRatedMovies,
    String? topRatedMessage,
  }) {
    return MoviesStates(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage);
  }

  const MoviesStates({
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = "",
    this.popularState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = "",
    this.topRatedState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = "",
  });

  @override
  List<Object> get props => [
        nowPlayingState,
        nowPlayingMovies,
        nowPlayingMessage,
        popularState,
        popularMovies,
        popularMessage,
        topRatedState,
        topRatedMovies,
        topRatedMessage
      ];
}
