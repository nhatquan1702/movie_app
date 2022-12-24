import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screen/home/cubit/upcoming_cubit/upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  MovieRepository? movieRepository;
  UpcomingMovieCubit() : super(UpcomingMovieStateInit()) {
    movieRepository = MovieRepository();
  }

  Future<void> fetchUpcomingMovieList({
    bool showLoading = true,
  }) async {
    if (showLoading) emit(UpcomingMovieStateLoading());
    try {
      final mList = await movieRepository?.fetchUpcomingMovieList();
      if (showLoading) emit(UpcomingMovieStateLoading());
      if (mList?.error == null && mList?.listMovie != null) {
        emit(UpcomingMovieStateSuccess(
          upcomingMovieResponse: mList!,
        ));
      } else {
        emit(UpcomingMovieStateError());
      }
    } catch (e) {
      if (showLoading) {
        emit(UpcomingMovieStateLoading());
      } else {
        emit(UpcomingMovieStateError());
      }
    }
  }
}
