import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repository/genre_repository.dart';
import 'package:movie_app/view/screen/home/cubit/genre_cubit/genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreRepository? genreRepo;
  GenreCubit() : super(GenreStateInit()) {
    genreRepo = GenreRepository();
  }

  Future<void> fetchGenre({
    bool showLoading = true,
  }) async {
    if (showLoading) emit(GenreStateLoading());
    try {
      final mList = await genreRepo?.fetchGenreList();
      if (showLoading) emit(GenreStateLoading());
      if (mList?.error == null && mList?.listGenre != null) {
        emit(GenreStateSuccess(
          genreResponse: mList!,
          listSelected: [],
        ));
      } else {
        emit(GenreStateError());
      }
    } catch (e) {
      if (showLoading) {
        emit(GenreStateLoading());
      } else {
        emit(GenreStateError());
      }
    }
  }

  Future<void> selectGenre(int index) async {
    if (state is GenreStateSuccess) {
      (state as GenreStateSuccess).listSelected.add(index);
      (state as GenreStateSuccess).cloneWith(
        genreList: (state as GenreStateSuccess).genreResponse,
        list: (state as GenreStateSuccess).listSelected,
      );
    }
    emit(state);
  }
}
