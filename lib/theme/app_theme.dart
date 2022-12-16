import 'package:chat_app/constants/style_constants.dart';
import 'package:chat_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = myTheme.copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: CustomTextTheme.textTheme,
      primaryColor: StyleConstants.primaryColor,
      iconTheme: const IconThemeData(color: StyleConstants.primaryColor));
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}

class CustomTextTheme {
  static TextTheme textTheme = const TextTheme().copyWith(
    titleLarge: GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Colors.black,
    ),
  );
}
