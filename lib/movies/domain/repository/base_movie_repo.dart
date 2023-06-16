import 'package:dartz/dartz.dart';
import 'package:watch_it_app/movies/domain/entities/movie.dart';
import 'package:watch_it_app/movies/domain/entities/movie_details.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_movie_use_case.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MoviesDetailsParameters parameters);
}
