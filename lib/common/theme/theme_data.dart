import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/const/app_colors.dart';
part 'text_theme.dart';

class CustomThemeData {
  static ThemeData weatherTheme = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.backgroundColor,

      /*    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.black,
    ), */
      /*   appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      iconTheme: IconThemeData(color: AppColors.black),
    ), */
      textTheme: _TextTheme.instance.textTheme,
      useMaterial3: true);
}
