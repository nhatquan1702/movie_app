import 'package:movie_app/data/model/network/client.dart';
import 'package:movie_app/data/model/network/response/model/genre/genre_model.dart';

class GenreRepository {
  final _client = ApiClient();

  Future<GenreList> fetchGenreList() {
    return _client.getListGenre();
  }
}

class NetworkError extends Error {}