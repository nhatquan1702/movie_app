import 'package:flutter/material.dart';
import 'package:movie_app/constant/route/route.dart';
import 'package:movie_app/constant/route/route_name.dart';
import 'package:movie_app/constant/theme/string.dart';
import 'package:movie_app/constant/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantString.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRouteName.home,
      onGenerateRoute: AppRoute.generate,
    );
  }
}
