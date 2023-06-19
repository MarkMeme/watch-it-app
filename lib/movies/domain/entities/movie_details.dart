import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String? backdropPath;

  final List<Genres> genres;

  final int id;

  final String overview;

  final String releaseDate;

  final String title;

  final int runtime;

  final double voteAverage;

  const MovieDetails(
      {this.backdropPath,
      required this.genres,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.runtime,
      required this.voteAverage});

  @override
  List<Object?> get props =>
      [
        backdropPath,
        genres,
        id,
        overview,
        releaseDate,
        title,
        runtime,
        voteAverage
      ];
}
