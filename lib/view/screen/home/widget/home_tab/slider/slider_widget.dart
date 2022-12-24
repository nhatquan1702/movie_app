import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/theme/theme_controller.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screen/home/widget/home_tab/slider/slider_movie.dart';

class UpComingWidget extends StatefulWidget {
  const UpComingWidget({
    Key? key,
    required this.themeController,
    required this.movieRepository,
  }) : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  // ignore: library_private_types_in_public_api
  _UpComingWidgetState createState() => _UpComingWidgetState();
}

class _UpComingWidgetState extends State<UpComingWidget> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.movieRepository,
      child: const UpComingSlider(),
    );
  }
}
