import 'package:movie_app/data/model/network/response/model/movie_model.dart';

abstract class UpcomingMovieState {}

class UpcomingMovieStateInit extends UpcomingMovieState {}

class UpcomingMovieStateLoading extends UpcomingMovieState {}

class UpcomingMovieStateSuccess extends UpcomingMovieState {
  MovieList upcomingMovieResponse;

  UpcomingMovieStateSuccess({
    required this.upcomingMovieResponse,
  });
}

class UpcomingMovieStateError extends UpcomingMovieState {}
