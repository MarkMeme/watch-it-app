import 'package:dartz/dartz.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetTopRatedMoviesUseCse {
  final BaseMovieRepo baseMovieRepo;

  GetTopRatedMoviesUseCse({required this.baseMovieRepo});

  Future<Either<Failure, List<Movie>>> execute() async {
    return baseMovieRepo.getTopRatedMovies();
  }
}
