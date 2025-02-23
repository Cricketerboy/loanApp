import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/pref_utils.dart';
import 'package:loanapp/core/utils/size_utils';

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable
class ThemeHelper {
  /// The current app theme
  var _appTheme = PrefUtils().getThemeData();

  /// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  /// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.h),
          ),
          shadowColor: appTheme.lightBlueA700.withAlpha(128),
          elevation: 1,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: appTheme.whiteA700.withAlpha(128),
          side: BorderSide(
            color: appTheme.gray20002,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: appTheme.gray300,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 16,
        space: 16,
        color: appTheme.blueGray200,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray600,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray800,
          fontSize: 11.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.gray800,
          fontSize: 10.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 20.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray800,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF0075FE),
    secondaryContainer: Color(0XFF455A64),
    onPrimary: Color(0XFF001824),
    onPrimaryContainer: Color(0XFF004675),
  );
}

/// Class containing custom colors for the app.
class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue5099 => Color(0X99D4EBFF);
  Color get blue900 => Color(0XFF0F4892);
  Color get blueA200 => Color(0XFF407BFF);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray200 => Color(0XFFB6BCCB);
  Color get blueGray300 => Color(0XFF8D93A3);
  Color get blueGray800 => Color(0XFF37474F);
  Color get blueGray900 => Color(0XFF263238);

  // Gray
  Color get gray100 => Color(0XFFF2F2F2);
  Color get gray10001 => Color(0XFFEFF6FF);
  Color get gray10002 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFEBEBEB);
  Color get gray20001 => Color(0XFFF0F0F0);
  Color get gray20002 => Color(0XFFEDEDED);
  Color get gray300 => Color(0XFFE3E4E8);
  Color get gray30001 => Color(0XFFE0E0E0);
  Color get gray400 => Color(0XFFC3C3C3);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray500 => Color(0XFF939393);
  Color get gray600 => Color(0XFF757575);
  Color get gray700 => Color(0XFF616161);
  Color get gray800 => Color(0XFF3A3A3A);

  // Light Blue
  Color get lightBlueA700 => Color(0XFF0075FF);

  // Light Green
  Color get lightGreenA700 => Color(0XFF590D2A);

  // Teal
  Color get teal700 => Color(0XFF00935D);
  Color get tealA400 => Color(0XFF14EBA1);
  Color get tealA40001 => Color(0XFF14E99F);
  Color get tealA700 => Color(0XFF00C488);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}
