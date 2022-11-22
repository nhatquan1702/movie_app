import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repository/genre_repository.dart';
import 'package:movie_app/view/screen/home/cubit/genre_cubit/genre_state.dart';

class GenreBloc extends Cubit<GenreState> {
  GenreRepository? genreRepo;
  GenreBloc() : super(GenreStateLoading()) {
    genreRepo = GenreRepository();
  }

  Future<void> fetchData() async {
    try {
      emit(GenreStateLoading());
      final mList = await genreRepo!.fetchGenreList();

      if (mList.error != null) {
        emit(GenreStateSuccess(
          genreResponse: mList,
          listSelected: [],
        ));
      } else {
        emit(GenreStateFail());
      }
    } catch (e) {
      emit(GenreStateFail());
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
