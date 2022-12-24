import 'package:flutter/material.dart';
import 'package:movie_app/constant/theme/theme_controller.dart';
import 'package:movie_app/data/model/network/response/model/movie_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviesListHorizontal extends StatelessWidget {
  const MoviesListHorizontal(
      {Key? key,
      required this.movies,
      required this.themeController,
      required this.movieRepository})
      : super(key: key);

  final List<Movie> movies;
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 8.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MovieDetailScreen(
                //         movieId: movies[index].id!),
                //   ),
                // );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.black87,
                      highlightColor: Colors.white54,
                      enabled: true,
                      child: Container(
                        color: Theme.of(context).canvasColor.withOpacity(0.5),
                        height: 180.0,
                        child: const AspectRatio(
                          aspectRatio: 2 / 3,
                          child: Icon(
                            Icons.movie_creation_outlined,
                            color: Colors.black26,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: movies[index].id ?? -1,
                      child: SizedBox(
                        height: 180.0,
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: FadeInImage.memoryNetwork(
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image:
                                  "https://image.tmdb.org/t/p/w300/${movies[index].poster ?? ''}",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
