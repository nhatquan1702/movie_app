import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int? id;
  final num? popularity;
  final String? title;
  final String? backPoster;
  final String? poster;
  final String? overview;
  final num? rating;
  final String? releaseDate;

  const Movie(this.id, this.popularity, this.title, this.backPoster,
      this.poster, this.overview, this.rating, this.releaseDate);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"] ?? "",
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"],
        releaseDate = json["release_date"];

  @override
  List<Object> get props => [
        id!,
        popularity!,
        title!,
        backPoster!,
        poster!,
        overview!,
        rating!,
      ];

  static const empty = Movie(null, null, null, null, null, null, null, null);
}

class MovieList {
  final List<Movie>? listMovie;
  final int? totalResults;
  final bool hasError;
  final String? error;

  MovieList(
    this.listMovie,
    this.totalResults,
    this.hasError,
    this.error,
  );

  MovieList.fromJson(Map<String, dynamic> json)
      : listMovie =
            (json["results"] as List).map((i) => Movie.fromJson(i)).toList(),
        totalResults = json["total_results"],
        hasError = false,
        error = null;

  MovieList.withError(String errorValue)
      : listMovie = null,
        totalResults = null,
        hasError = true,
        error = errorValue;
}
