import 'package:dio/dio.dart';
import 'package:watch_it_app/core/error/exceptions.dart';
import 'package:watch_it_app/core/network/error_message_model.dart';
import 'package:watch_it_app/core/utils/constants.dart';
import 'package:watch_it_app/movies/data/model/movie_details_model.dart';
import 'package:watch_it_app/movies/data/model/movie_model.dart';
import 'package:watch_it_app/movies/domain/use_cases/get_recommendatin_use_case.dart';

import '../../domain/use_cases/get_movie_use_case.dart';
import '../model/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MoviesDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await Dio().get(
        "${AppConstants.baseUrl}${AppConstants.nowPlayingEndPoint}?api_key=${AppConstants.apiKey}");
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw {
        ServerError(
            errorMessageModel: ErrorMessageModel.fromJson(response.data))
      };
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
        "${AppConstants.baseUrl}${AppConstants.popularEndPoint}?api_key=${AppConstants.apiKey}");
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw {
        ServerError(
            errorMessageModel: ErrorMessageModel.fromJson(response.data))
      };
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
        "${AppConstants.baseUrl}${AppConstants.topRatedEndPoint}?api_key=${AppConstants.apiKey}");
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw {
        ServerError(
            errorMessageModel: ErrorMessageModel.fromJson(response.data))
      };
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MoviesDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstants.moviesDetailsPath(parameters.movieID));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw {
        ServerError(
            errorMessageModel: ErrorMessageModel.fromJson(response.data))
      };
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(AppConstants.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw {
        ServerError(
            errorMessageModel: ErrorMessageModel.fromJson(response.data))
      };
    }
  }
}
