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
}
