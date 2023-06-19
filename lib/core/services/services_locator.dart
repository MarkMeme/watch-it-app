import 'package:get_it/get_it.dart';
import 'package:watch_it_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:watch_it_app/movies/data/repository/movie_repo.dart';
import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_movie_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_recommendatin_use_case.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_bloc.dart';

import '../../movies/presentation/cotroller/movie_details_bloc.dart';

final getIt = GetIt.instance;

///
///
///  with get it i want to create a single class that always use to save memory
///
///

class ServicesLocator {
  void init() {
    /// BLOC
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt(), getIt()));

    /// DATA SOURCE
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// REPO
    getIt.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(getIt()));

    /// USE CASE
    getIt.registerLazySingleton(
        () => GetNowPlayingUseCse(baseMovieRepo: getIt()));
    getIt.registerLazySingleton(
        () => GetPopularMoviesUseCse(baseMovieRepo: getIt()));
    getIt.registerLazySingleton(
        () => GetTopRatedMoviesUseCse(baseMovieRepo: getIt()));
    getIt.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMovieRepo: getIt()));
    getIt.registerLazySingleton(() => GetRecommendationUseCase(getIt()));
  }
}
