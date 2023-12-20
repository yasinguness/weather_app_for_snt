import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/const/app_colors.dart';
part 'text_theme.dart';

class CustomThemeData {
  static ThemeData weatherTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: _TextTheme.instance.textTheme,
    colorSchemeSeed: const Color.fromARGB(255, 62, 102, 181),
    useMaterial3: true,
  );
}
