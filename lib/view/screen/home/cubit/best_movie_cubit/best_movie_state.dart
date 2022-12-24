import 'package:movie_app/data/model/network/response/model/movie_model.dart';

abstract class BestMovieState {}

class BestMovieStateInit extends BestMovieState {}

class BestMovieStateLoading extends BestMovieState {}

class BestMovieStateSuccess extends BestMovieState {
  MovieList bestMovieResponse;

  BestMovieStateSuccess({
    required this.bestMovieResponse,
  });
}

class BestMovieStateError extends BestMovieState {}
