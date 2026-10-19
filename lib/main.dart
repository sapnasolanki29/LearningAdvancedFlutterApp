import 'package:flutter/material.dart';
import 'package:flutterprojects/home_page.dart';
import 'package:flutterprojects/routes/routes.dart';
import 'package:flutterprojects/widget/my_theme.dart';

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
   theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(),
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