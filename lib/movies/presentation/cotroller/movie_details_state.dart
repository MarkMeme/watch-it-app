part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.message = ''});

  final MovieDetails? movieDetails;

  final RequestState movieDetailsState;

  final String message;

  MovieDetailsState copyWith(
      {MovieDetails? movieDetails,
      RequestState? movieDetailsState,
      String? message}) {
    return MovieDetailsState(
        message: message ?? this.message,
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState);
  }

  @override
  List<Object?> get props => [movieDetailsState, movieDetails, message];
}
