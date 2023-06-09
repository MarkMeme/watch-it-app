class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "49f56c3a32d0ff990c670cbb331e7d84";

  static const String nowPlayingEndPoint = "/movie/now_playing";
  static const String topRatedEndPoint = "/movie/top_rated";
  static const String popularEndPoint = "/movie/popular";

  static String moviesDetailsPath(int movieID) =>
      '$baseUrl/movie/$movieID?api_key=$apiKey';

  static String recommendationPath(int movieID) =>
      '$baseUrl/movie/$movieID/recommendations?api_key=$apiKey';
}

//https://api.themoviedb.org/3/movie/438148?api_key=49f56c3a32d0ff990c670cbb331e7d84
//https://api.themoviedb.org/3/movie/438148/recommendations?api_key=49f56c3a32d0ff990c670cbb331e7d84
