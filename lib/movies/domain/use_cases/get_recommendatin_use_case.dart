import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it_app/core/error/failure.dart';
import 'package:watch_it_app/core/use_case/base_use_case.dart';
import 'package:watch_it_app/movies/domain/entities/recommendation.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetRecommendationUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepo.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
