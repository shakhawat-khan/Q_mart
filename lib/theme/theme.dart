import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light({Color color = const Color(0xFFFF5E03)}) => ThemeData(

  textTheme: GoogleFonts.interTextTheme(),
  primaryColor: color,
  secondaryHeaderColor: const Color(0xFF272727),
  disabledColor: const Color(0xFFBABFC4),
  backgroundColor: Colors.green.shade50,

  errorColor: const Color(0xFFE84D4F),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,

  colorScheme: ColorScheme.light(primary: color, secondary: color,),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: color)),
);