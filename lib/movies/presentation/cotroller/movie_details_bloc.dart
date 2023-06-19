import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it_app/core/utils/request_states.dart';
import 'package:watch_it_app/movies/domain/entities/movie_details.dart';
import 'package:watch_it_app/movies/domain/entities/recommendation.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_movie_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_recommendatin_use_case.dart';

import '../screens/dummy.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MoviesDetailsParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error, message: l.message)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> _getRecommendation(GetRecommendationMoviesEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendationState: RequestState.loaded, recommendation: r)));
  }
}
