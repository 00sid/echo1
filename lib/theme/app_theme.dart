import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class AppTheme {
  static ThemeData get lightColorPalette {
    return PeamanTheme.lightThemePalette.copyWith(
      colorScheme: const ColorScheme.light(
        background: AppColor.white,
        primary: AppColor.green,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.green,
          foregroundColor: AppColor.black,
          textStyle: const TextStyle(
            fontSize: 16.0,
          ),
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkColorPalette {
    return PeamanTheme.darkThemePalette.copyWith(
      colorScheme: const ColorScheme.dark(
        background: AppColor.black,
        primary: AppColor.green,
      ),
      textTheme: TextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.green,
          foregroundColor: AppColor.black,
          textStyle: const TextStyle(
            fontSize: 16.0,
          ),
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: PeamanColors.white,
        prefixIconColor: PeamanColors.primary,
        suffixIconColor: PeamanColors.primary,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          color: AppColor.black,
        ),
      ),
    );
  }
}
