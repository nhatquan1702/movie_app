import 'package:movie_app/data/model/network/client.dart';
import 'package:movie_app/data/model/network/response/model/movie_model.dart';

class MovieRepository {
  final _client = ApiClient();

  Future<MovieList?> fetchUpcomingMovieList() {
    return _client.getUpcomingMovieList();
  }

  Future<MovieList?> fetchNowPlayingList() {
    return _client.getNowPlayingList();
  }
}