import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovieEvent extends MoviesEvents {}

class GetPopularMoviesEvent extends MoviesEvents {}

class GetTopRatedMovieEvent extends MoviesEvents {}
