import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(18, 18, 18, 1),
      elevation: 0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xffB4D5FE),
    ),
  );
}
