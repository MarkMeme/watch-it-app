import 'package:watch_it_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepo {
  Future<List<Movie>> getNowPlaying();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();
}
