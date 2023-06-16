import 'package:dartz/dartz.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCse extends BaseUseCase<List<Movie>> {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUseCse({required this.baseMovieRepo});

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return baseMovieRepo.getPopularMovies();
  }
}
