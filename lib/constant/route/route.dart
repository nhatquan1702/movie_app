import 'package:flutter/material.dart';
import 'package:movie_app/constant/route/route_name.dart';
import 'package:movie_app/view/screen/detail/detail_movie_screen.dart';
import 'package:movie_app/view/screen/home/home_screen.dart';
import 'package:movie_app/view/screen/search/search_screen.dart';
import 'package:movie_app/view/screen/welcome/welcome_screen.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );

      case AppRouteName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.search:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const SearchScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.detailMovie:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailMovieScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }

    return null;
  }
}