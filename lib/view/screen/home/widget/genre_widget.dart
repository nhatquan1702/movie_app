import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/route/route_name.dart';
import 'package:movie_app/constant/theme/color.dart';
import 'package:movie_app/view/screen/home/cubit/genre_cubit/genre_cubit.dart';
import 'package:movie_app/view/screen/home/cubit/genre_cubit/genre_state.dart';
import 'package:shimmer/shimmer.dart';

class GenreWidget extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          if (shrinkOffset == 80)
            const BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset.zero,
            ),
        ],
      ),
      child: BlocBuilder<GenreBloc, GenreState>(
        builder: (context, state) {
          if (state is GenreStateLoading || state is GenreStateInit) {
            return const CollectionLoading();
          }
          else if (state is GenreStateSuccess) {
            final genreList = state.genreResponse.listGenre;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: genreList!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteName.search,
                      arguments: genreList[index].id,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      genreList[index].name ?? '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).backgroundColor,
                          ),
                      maxLines: 1,
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const SizedBox(
              child: Center(
                child: Text('Error'),
              ),
            );
          }
        },
      ),
    );
  }
}

class CollectionLoading extends StatelessWidget {
  const CollectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shimmer.fromColors(
      baseColor: theme.backgroundColor.withOpacity(0.5),
      highlightColor: theme.canvasColor.withOpacity(0.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.only(left: index == 0 ? 0 : 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: BorderRadius.circular(36),
            ),
            alignment: Alignment.center,
          );
        },
      ),
    );
  }
}
