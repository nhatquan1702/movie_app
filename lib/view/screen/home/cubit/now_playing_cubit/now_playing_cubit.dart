import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screen/home/cubit/now_playing_cubit/now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  MovieRepository? movieRepository;
  NowPlayingCubit() : super(NowPlayingStateInit()) {
    movieRepository = MovieRepository();
  }

  Future<void> fetchNowPlayingList({
    bool showLoading = true,
  }) async {
    if (showLoading) emit(NowPlayingStateLoading());
    try {
      final mList = await movieRepository?.fetchNowPlayingList();
      if (showLoading) emit(NowPlayingStateLoading());
      if (mList?.error == null && mList?.listMovie != null) {
        emit(NowPlayingStateSuccess(
          nowPlayingResponse: mList!,
        ));
      } else {
        emit(NowPlayingStateError());
      }
    } catch (e) {
      if (showLoading) {
        emit(NowPlayingStateLoading());
      } else {
        emit(NowPlayingStateError());
      }
    }
  }
}
