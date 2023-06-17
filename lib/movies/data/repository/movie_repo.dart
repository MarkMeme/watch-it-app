import 'package:dartz/dartz.dart';
import 'package:watch_it_app/core/error/exceptions.dart';
import 'package:watch_it_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:watch_it_app/movies/domain/entities/movie.dart';
import 'package:watch_it_app/movies/domain/entities/movie_details.dart';
import 'package:watch_it_app/movies/domain/entities/recommendation.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_movie_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_recommendatin_use_case.dart';

import '../../../core/error/failure.dart';

class MovieRepo extends BaseMovieRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepo(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlaying();
    try {
      return right(result);
    } on ServerError catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return right(result);
    } on ServerError catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return right(result);
    } on ServerError catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MoviesDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return right(result);
    } on ServerError catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return right(result);
    } on ServerError catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
