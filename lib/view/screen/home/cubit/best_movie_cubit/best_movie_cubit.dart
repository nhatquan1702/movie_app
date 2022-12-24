import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screen/home/cubit/best_movie_cubit/best_movie_state.dart';

class BestMovieCubit extends Cubit<BestMovieState> {
  MovieRepository? movieRepository;
  BestMovieCubit() : super(BestMovieStateInit()) {
    movieRepository = MovieRepository();
  }

  Future<void> fetchBestMovieList({
    bool showLoading = true,
  }) async {
    if (showLoading) emit(BestMovieStateLoading());
    try {
      final mList = await movieRepository?.fetchBestMovieList();
      if (showLoading) emit(BestMovieStateLoading());
      if (mList?.error == null && mList?.listMovie != null) {
        emit(BestMovieStateSuccess(
          bestMovieResponse: mList!,
        ));
      } else {
        emit(BestMovieStateError());
      }
    } catch (e) {
      if (showLoading) {
        emit(BestMovieStateLoading());
      } else {
        emit(BestMovieStateError());
      }
    }
  }
}
