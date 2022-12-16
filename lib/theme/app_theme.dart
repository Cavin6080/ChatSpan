import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: CustomTextTheme.textTheme,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}

class CustomTextTheme {
  static TextTheme textTheme = TextTheme().copyWith(
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
