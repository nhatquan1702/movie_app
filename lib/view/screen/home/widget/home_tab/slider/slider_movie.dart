import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/view/screen/home/cubit/upcoming_cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/view/screen/home/cubit/upcoming_cubit/upcoming_movie_state.dart';

import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class UpComingSlider extends StatelessWidget {
  const UpComingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          UpcomingMovieCubit()..fetchUpcomingMovieList(showLoading: true),
      child: const UpComingView(),
    );
  }
}

class UpComingView extends StatelessWidget {
  const UpComingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UpcomingMovieCubit>().state;
    if (state is UpcomingMovieStateError) {
      return const Center(child: Text('Oops something went wrong!'));
    } else if (state is UpcomingMovieStateSuccess) {
      return Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 290,
              aspectRatio: 16 / 9,
              viewportFraction: 0.6,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: state.upcomingMovieResponse.listMovie!
                .map(
                  (movie) => Stack(
                    children: [
                      Stack(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.black87,
                            highlightColor: Colors.white54,
                            enabled: true,
                            child: AspectRatio(
                              aspectRatio: 2 / 2.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  color: Theme.of(context).canvasColor.withOpacity(0.5),
                                  child: const Icon(
                                    Icons.movie_creation_outlined,
                                    color: Colors.black26,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            child: AspectRatio(
                              aspectRatio: 2 / 2.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomCenter,
                                  placeholder: kTransparentImage,
                                  image:
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "https://image.tmdb.org/t/p/original/" +
                                          movie.poster!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AspectRatio(
                        aspectRatio: 2 / 2.8,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: const [
                                  0.0,
                                  0.6,
                                  0.6,
                                  1.0
                                ],
                                colors: [
                                  Theme.of(context).backgroundColor.withOpacity(1.0),
                                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                                ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 5,
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${movie.title}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                'Công chiếu: ${movie.releaseDate}',
                                style: const TextStyle(
                                  fontSize: 8.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      );
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
