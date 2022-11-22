import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/network/response/model/genre/genre_model.dart';

class ApiClient {
  final Dio _dio = Dio();
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static String mainUrl = "https://api.themoviedb.org/3";
  var getGenresUrl = "$mainUrl/genre/movie/list";

  Future<GenreList> getListGenre() async {
    var params = {"api_key": apiKey, "language": "vi-VN"};
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
}