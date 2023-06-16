import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backDropPath;

  final List<Genres> genres;

  final int id;

  final String overView;

  final String releaseDate;

  final String title;

  final int runTime;

  final String voteAverage;

  const MovieDetails(
      {required this.backDropPath,
      required this.genres,
      required this.id,
      required this.overView,
      required this.releaseDate,
      required this.title,
      required this.runTime,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backDropPath,
        genres,
        id,
        overView,
        releaseDate,
        title,
        runTime,
        voteAverage
      ];
}
