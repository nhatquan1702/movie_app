import 'package:movie_app/data/model/network/response/model/movie_model.dart';

abstract class NowPlayingState {}

class NowPlayingStateInit extends NowPlayingState {}

class NowPlayingStateLoading extends NowPlayingState {}

class NowPlayingStateSuccess extends NowPlayingState {
  MovieList nowPlayingResponse;

  NowPlayingStateSuccess({
    required this.nowPlayingResponse,
  });
}

class NowPlayingStateError extends NowPlayingState {}
