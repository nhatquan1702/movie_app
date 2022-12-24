import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/theme/theme_controller.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screen/home/cubit/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_app/view/screen/home/cubit/now_playing_cubit/now_playing_state.dart';
import 'package:movie_app/view/screen/home/widget/home_tab/now_playing/movie_list_horizontal.dart';

class NowPlayingList extends StatelessWidget {
  const NowPlayingList(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NowPlayingCubit()..fetchNowPlayingList(showLoading: true),
      child: NowPlayingView(
        themeController: themeController,
        movieRepository: movieRepository,
      ),
    );
  }
}

class NowPlayingView extends StatelessWidget {
  const NowPlayingView(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NowPlayingCubit>().state;
    if (state is NowPlayingStateError) {
      return const Center(child: Text('Oops something went wrong!'));
    } else if (state is NowPlayingStateSuccess) {
      if (state.nowPlayingResponse.listMovie!.isEmpty) {
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
          movies: state.nowPlayingResponse.listMovie!,
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
