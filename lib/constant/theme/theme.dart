import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constant/theme/color.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundWhite,
    canvasColor: AppColors.backgroundBlack,
    scaffoldBackgroundColor: AppColors.primarySwatch.shade50,
    primarySwatch: AppColors.primarySwatch,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColors.backgroundBlack,
    canvasColor: AppColors.backgroundWhite,
    scaffoldBackgroundColor: AppColors.primarySwatch.shade900,
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.primarySwatch,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    useMaterial3: true,
  );
}