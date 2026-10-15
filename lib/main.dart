import 'package:flutter/material.dart';
import 'package:flutterprojects/home_page.dart';
import 'package:flutterprojects/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:"Theme Demo",
    //Light Theme configuration
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:ColorScheme.fromSeed(
            seedColor:Colors.deepPurple,
            brightness:Brightness.light,
          ),

fontFamily: GoogleFonts.lato().fontFamily,
appBarTheme: AppBarThemeData(
  foregroundColor: Colors.white,
  backgroundColor: Theme.of(context).colorScheme.primary
),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),

          floatingActionButtonTheme: FloatingActionButtonThemeData(
             backgroundColor:Colors.deepPurple,
            foregroundColor: Colors.white
          ),
        ),
    //Dark theme Configuration---------
        darkTheme:ThemeData.dark(
          useMaterial3: true,

        ),
    //Automatically switch based on system settings
        themeMode:ThemeMode.light,
      debugShowCheckedModeBanner: false,
      //home:HomePage(),
      routes:{
        "/":(context)=>LoginPage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),
        MyRoutes.homeRoute:(context)=>HomePage(),
      },
    );
  }
}