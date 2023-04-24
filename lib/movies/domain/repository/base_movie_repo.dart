import 'package:dartz/dartz.dart';
import 'package:watch_it_app/movies/domain/entities/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
