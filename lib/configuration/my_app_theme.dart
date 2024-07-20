
// import 'package:app_fem_nage/configuration/my_app_colors.dart';
import 'package:app_fem_nage/configuration/constants.dart';
import 'package:app_fem_nage/configuration/my_app_colors.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData myLight(){
    return ThemeData(
        useMaterial3: true,
        fontFamily: Constants.defaultFontFamily,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: MyAppColors.primary,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: Constants.defaultFontFamily,
                fontSize: 22
            ),
            iconTheme: const IconThemeData(
                color: Colors.white
            )
        ),
        colorScheme: const ColorScheme.light(
            secondary: MyAppColors.secondary,
            primary: MyAppColors.primary
        ),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: Constants.defaultFontFamily
            )
        )
    );
  }
}