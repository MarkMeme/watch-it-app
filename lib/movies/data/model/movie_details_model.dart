import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backDropPath,
      required super.genres,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.title,
      required super.runTime,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backDropPath: json['backdrop_path'],
          genres: List.from(json['genres'].map((x) => GenresModel.fromJson(x))),
          id: json['id'],
          overView: json['overview'],
          releaseDate: json['release_date'],
          title: json['title'],
          runTime: json['runtime'],
          voteAverage: json['vote_average']);
}
