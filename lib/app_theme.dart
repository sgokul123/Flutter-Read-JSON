import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/values/colors.dart';
import 'package:quiz_app/values/dimensions.dart';

class AppTheme {
  BuildContext context;

  AppTheme({@required this.context});

  ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = TextTheme(
        headline1: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        headline2: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        headline3: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
        ),
        headline4: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 16,
            fontStyle: FontStyle.normal,
          ),
        ),
        headline5: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
        headline6: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        bodyText1: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.colorPrimary,
            fontSize: AppDimensions.textSizeMedium,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          ),
        ),
        bodyText2: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontSize: AppDimensions.textSizeMedium,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          ),
        ),
        button: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColor.white,
            fontStyle: FontStyle.normal,
            fontSize: AppDimensions.textSizeSecondary,
            fontWeight: FontWeight.w400,
          ),
        ));

    ColorScheme colorScheme = ColorScheme(
        // Decide how you want to apply your own custom them, to the MaterialApp
        brightness: Brightness.light,
        primary: CustomColor.colorPrimary,
        primaryVariant: CustomColor.colorPrimary,
        secondary: CustomColor.colorPrimary,
        secondaryVariant: CustomColor.colorPrimary,
        background: CustomColor.purple,
        surface: CustomColor.purple,
        onBackground: CustomColor.grey,
        onSurface: Colors.black,
        onError: CustomColor.red,
        onPrimary: Colors.white,
        onSecondary: Colors.grey,
        error: CustomColor.red);

    return ThemeData(
      textTheme: txtTheme,
      colorScheme: colorScheme,
      fontFamily: 'poppins',
      primaryColor: CustomColor.colorPrimary,
      errorColor: CustomColor.red,
      backgroundColor: CustomColor.purple,
      toggleableActiveColor: CustomColor.colorPrimary,
      cursorColor: CustomColor.colorPrimary,
    );
  }
}
