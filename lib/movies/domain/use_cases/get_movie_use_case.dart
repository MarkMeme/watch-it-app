import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it_app/core/error/failure.dart';
import 'package:watch_it_app/core/use_case/base_use_case.dart';
import 'package:watch_it_app/movies/domain/entities/movie_details.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MoviesDetailsParameters> {
  BaseMovieRepo baseMovieRepo;

  GetMovieDetailsUseCase({required this.baseMovieRepo});

  @override
  Future<Either<Failure, MovieDetails>> call(
      MoviesDetailsParameters parameters) async {
    return baseMovieRepo.getMovieDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int movieID;

  const MoviesDetailsParameters(this.movieID);

  @override
  List<Object?> get props => [movieID];
}
