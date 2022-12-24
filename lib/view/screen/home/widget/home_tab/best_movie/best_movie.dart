import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/theme/theme_controller.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screen/home/cubit/best_movie_cubit/best_movie_cubit.dart';
import 'package:movie_app/view/screen/home/cubit/best_movie_cubit/best_movie_state.dart';
import 'package:movie_app/view/screen/home/widget/home_tab/now_playing/movie_list_horizontal.dart';

class BestMovieList extends StatelessWidget {
  const BestMovieList(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BestMovieCubit()..fetchBestMovieList(showLoading: true),
      child: BestMovieView(
        themeController: themeController,
        movieRepository: movieRepository,
      ),
    );
  }
}

class BestMovieView extends StatelessWidget {
  const BestMovieView(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BestMovieCubit>().state;
    if (state is BestMovieStateError) {
      return const Center(child: Text('Oops something went wrong!'));
    } else if (state is BestMovieStateSuccess) {
      if (state.bestMovieResponse.listMovie!.isEmpty) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text(
                    "No More Popular Movies",
                    style: TextStyle(color: Colors.black45),
                  )
                ],
              )
            ],
          ),
        );
      } else {
        return MoviesListHorizontal(
          movies: state.bestMovieResponse.listMovie!,
          movieRepository: movieRepository,
          themeController: themeController,
        );
      }
    } else {
      return const SizedBox(
        height: 290,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}