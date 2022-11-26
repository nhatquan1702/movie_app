import 'package:movie_app/data/model/network/response/model/genre/genre_model.dart';

abstract class GenreState {}

class GenreStateInit extends GenreState {}

class GenreStateLoading extends GenreState {}

class GenreStateSuccess extends GenreState {
  GenreList genreResponse;
  List<int> listSelected;

  GenreStateSuccess({
    required this.genreResponse,
    required this.listSelected,
  });

  GenreStateSuccess cloneWith(
      {required GenreList genreList, required List<int> list}) {
    return GenreStateSuccess(
      genreResponse: genreList,
      listSelected: list,
    );
  }
}

class GenreStateError extends GenreState {}