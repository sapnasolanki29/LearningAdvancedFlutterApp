import 'package:flutter/material.dart';
import 'package:flutterprojects/widget/drawer.dart';

class HomePage extends StatelessWidget{
  final int days=30;
  final String name="dream code";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Catalog App"),
     ),
     body:Center(
         child: Text("Welcome to $days of flutter $name"),
     ),
     drawer:MyDrawer(),
     );

  }
}