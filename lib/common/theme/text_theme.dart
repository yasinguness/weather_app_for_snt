part of './theme_data.dart';

class _TextTheme {
  _TextTheme._init();
  static _TextTheme? _instance;
  static _TextTheme get instance {
    _instance ??= _TextTheme._init();
    return _instance!;
  }

  final TextTheme textTheme = const TextTheme(
    bodyMedium: TextStyle(color: AppColors.black, fontSize: 28),
    bodySmall: TextStyle(color: AppColors.black, fontSize: 18),
    labelLarge: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(color: AppColors.textColor, fontSize: 24),
  );
}
