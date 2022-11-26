import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/route/route_name.dart';
import 'package:movie_app/constant/theme/color.dart';
import 'package:movie_app/view/screen/home/cubit/genre_cubit/genre_cubit.dart';
import 'package:movie_app/view/screen/home/cubit/genre_cubit/genre_state.dart';
import 'package:movie_app/view/screen/home/widget/genre_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeTabLayout extends StatefulWidget {
  const HomeTabLayout({Key? key}) : super(key: key);

  @override
  State<HomeTabLayout> createState() => _HomeTabLayoutState();
}

class _HomeTabLayoutState extends State<HomeTabLayout> {
  final GenreCubit _genreBloc = GenreCubit();

  @override
  void initState() {
    _genreBloc.fetchGenre(showLoading: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController();
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => _genreBloc,
      child: Scaffold(
        body: BlocBuilder<GenreCubit, GenreState>(
          builder: (context, state) {
            if (state is GenreStateSuccess) {
              if (refreshController.isRefresh) {
                refreshController.refreshCompleted();
              }
              if (refreshController.isLoading) {
                refreshController.loadComplete();
              }
            }
            if (state is GenreStateError) {
              if (refreshController.isRefresh) {
                refreshController.refreshCompleted();
              }
              if (refreshController.isLoading) {
                refreshController.loadComplete();
              }
            }
            return Scaffold(
              body: SafeArea(
                child: SmartRefresher(
                  controller: refreshController,
                  header: CustomHeader(
                    builder: (context, mode) {
                      if (mode == RefreshStatus.idle) {
                        return const SizedBox();
                      }
                      return Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                  footer: CustomFooter(
                    builder: (context, mode) {
                      if (mode == LoadStatus.idle) {
                        return const SizedBox();
                      }
                      return Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                  enablePullUp: true,
                  onRefresh: () {
                    context.read<GenreCubit>().fetchGenre(showLoading: true);
                  },
                  enablePullDown: true,
                  onLoading: () {},
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        centerTitle: true,
                        title: Text(
                          "Khám phá",
                          style: theme.textTheme.headlineSmall,
                        ),
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                        ),
                        backgroundColor: theme.scaffoldBackgroundColor,
                        elevation: 0,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(76),
                          child: Container(
                            height: 76,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouteName.search,
                                );
                              },
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: theme.backgroundColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.search,
                                      color: theme.canvasColor.withOpacity(0.6),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Nhập từ khóa tìm kiếm",
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color:
                                            theme.canvasColor.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: GenreWidget(),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            "Phổ biến dành cho bạn",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      // const SliverPadding(
                      //   padding: EdgeInsets.all(16),
                      //   sliver: PhotoWidget(),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
