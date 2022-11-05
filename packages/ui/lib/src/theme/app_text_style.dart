part of 'theme.dart';

const _fontPackage = 'ui';

/// Different [TextStyle] used in the app
abstract class AppTextStyle {
  /// Font size: 28 | Color: white
  static const headline1 = TextStyle(
    fontSize: 28,
    package: _fontPackage,
    color: AppColors.black,
  );

  /// Font size: 24 | Color: white
  static const headline2 = TextStyle(
    fontSize: 24,
    package: _fontPackage,
    color: AppColors.black,
  );

  /// Font size: 20 | Color: darkBlue
  static const headline3 = TextStyle(
    color: AppColors.independence,
    fontSize: 20,
    package: _fontPackage,
    fontWeight: FontWeight.bold,
  );

  /// Font size: 16 | Color: white
  static const headline4 = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    package: _fontPackage,
  );

  /// Font size: 214| Color: white
  static const headline5 = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    package: _fontPackage,
  );

  /// Font size: 12 | Color: white
  static const subtitle1 = TextStyle(
    fontSize: 12,
    package: _fontPackage,
    color: AppColors.yellow,
  );
}
