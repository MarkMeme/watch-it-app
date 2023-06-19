part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.message = '',
      this.recommendation = recommendationDummy,
      this.recommendationMessage = '',
      this.recommendationState = RequestState.loading});

  final MovieDetails? movieDetails;

  final RequestState movieDetailsState;

  final String message;

  final List<Recommendation> recommendation;

  final RequestState recommendationState;

  final String recommendationMessage;

  MovieDetailsState copyWith(
      {MovieDetails? movieDetails,
      RequestState? movieDetailsState,
      String? message,
      List<Recommendation>? recommendation,
      RequestState? recommendationState,
      String? recommendationMessage}) {
    return MovieDetailsState(
        message: message ?? this.message,
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage);
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetails,
        message,
        recommendationMessage,
        recommendationState,
        recommendation
      ];
}
