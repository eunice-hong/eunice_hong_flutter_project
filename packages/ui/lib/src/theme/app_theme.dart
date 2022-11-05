part of 'theme.dart';

/// App theme
class AppTheme {
  /// Standard [ThemeData] for App UI
  static ThemeData get standard {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.seaSerpent,
        secondary: AppColors.mediumSkyBlue,
      ),
      textTheme: _textTheme,
    );
  }

  static TextTheme get _textTheme {
    return GoogleFonts.fugazOneTextTheme(
      TextTheme(
        headline1: AppTextStyle.headline1,
        headline2: AppTextStyle.headline2,
        headline3: AppTextStyle.headline3,
        headline4: AppTextStyle.headline4,
        headline5: AppTextStyle.headline5,
        subtitle1: AppTextStyle.subtitle1,
      ),
    );
  }
}
