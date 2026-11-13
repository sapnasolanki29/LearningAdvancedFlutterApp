import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Favorites/pages/favorite_page.dart';
import 'package:flutterprojects/Providers/user_provider.dart';
import 'package:flutterprojects/home_page.dart';
import 'package:flutterprojects/profile_page.dart';
import 'package:flutterprojects/routes/routes.dart';
import 'package:flutterprojects/widget/my_theme.dart';
import 'package:provider/provider.dart';

import 'Favorites/bloc/favorite_bloc.dart';
import 'login_page.dart';

void main(){
  runApp(
    MultiProvider(
    providers:[ ChangeNotifierProvider(
        create: (_)=>UserProvider(),
  child: MyApp(),
  )],
        child: BlocProvider(
        create:(_)=>FavoriteBloc(),
  child:const MyApp(),
    )
    )


  );
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
        MyRoutes.profileRoute:(context)=>ProfilePage(),
        MyRoutes.favoriteRoute:(context)=>FavoritePage(),
      },
    );
  }
}