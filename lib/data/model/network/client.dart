import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/network/response/model/genre/genre_model.dart';
import 'package:movie_app/data/model/network/response/model/movie_model.dart';
import 'package:movie_app/data/model/network/response/model/video.dart';

class ApiClient {
  final Dio _dio = Dio();
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  final String language = 'vi-VN';
  static String mainUrl = "https://api.themoviedb.org/3";
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getUpComingUrl = '$mainUrl/movie/upcoming';
  var getNowPlayingMoviesApi = '$mainUrl/movie/now_playing';
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var movieUrl = "$mainUrl/movie";

  Future<GenreList?> getListGenre() async {
    var params = {"api_key": apiKey, "language": language};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreList.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return GenreList.withError("$error");
    }
  }

  Future<MovieList> getUpcomingMovieList() async {
    var params = {"api_key": apiKey, "language": language, "page": 1};
    try {
      Response response =
          await _dio.get(getUpComingUrl, queryParameters: params);
      return MovieList.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieList.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieList> getNowPlayingList() async {
    var params = {"api_key": apiKey, "language": language, "page": 1};
    try {
      Response response =
      await _dio.get(getNowPlayingMoviesApi, queryParameters: params);
      return MovieList.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieList.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieList> getBestMovieList() async {
    var params = {"api_key": apiKey, "language": language, "page": 1};
    try {
      Response response =
      await _dio.get(getPopularUrl, queryParameters: params);
      return MovieList.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieList.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<Video?> getMovieVideo(int movieId) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
    try {
      Response response = await _dio.get("$movieUrl/$movieId/videos", queryParameters: params);
      return Video.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return null;
    }
  }
}
