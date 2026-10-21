import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme {
  //Light Theme configuration
  static ThemeData lightTheme(BuildContext context)=>  ThemeData(
    useMaterial3: true,
    colorScheme:ColorScheme(
      primary: Color(0xFF86CC4F),        // Deep mint green for high contrast & readability
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFBCE39D), // Your exact color as a perfect container/card background
      onPrimaryContainer: Color(0xFF284A19),

      secondary: Color(0xFF506355),      // Soft matching secondary green-slate
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFD6EEC2),
      onSecondaryContainer: Color(0xFF0D1F14),

      surface: Color(0xFFF4FBF6),        // Ultra-clean clean background with a touch of mint
      onSurface: Color(0xFF171D19),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      //seedColor:Colors.greenAccent,
      brightness:Brightness.light,
    ),

    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:Colors.deepPurple,
        foregroundColor: Colors.white
    ),
    );

  //Dark theme Configuration---------
  static ThemeData darkTheme()=>
    ThemeData.dark(
      useMaterial3: true,

    );

}