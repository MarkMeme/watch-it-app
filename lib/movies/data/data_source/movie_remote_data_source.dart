import 'package:dio/dio.dart';
import 'package:watch_it_app/core/error/exceptions.dart';
import 'package:watch_it_app/core/network/error_message_model.dart';
import 'package:watch_it_app/core/utils/constants.dart';
import 'package:watch_it_app/movies/data/model/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
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
}
