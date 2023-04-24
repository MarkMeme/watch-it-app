import 'package:watch_it_app/movies/domain/repository/base_movie_repo.dart';
import '../entities/movie.dart';

class GetNowPlayingUseCse {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingUseCse({required this.baseMovieRepo});

  Future<List<Movie>> execute() async {
    return baseMovieRepo.getNowPlaying();
  }
}
