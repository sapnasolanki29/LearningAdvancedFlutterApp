import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme {
  //Light Theme configuration
  static ThemeData lightTheme(BuildContext context)=>  ThemeData(
    useMaterial3: true,
    colorScheme:ColorScheme.fromSeed(
      seedColor:Colors.deepPurple,
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