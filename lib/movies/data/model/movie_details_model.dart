import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.runtime,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath:
              json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
          genres: List.from(json['genres'].map((x) => GenresModel.fromJson(x))),
          id: json['id'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          title: json['title'],
          runtime: json['runtime'],
          voteAverage: json['vote_average'].toDouble());
}
