import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojects/Models/catalog.dart';
import 'package:flutterprojects/widget/drawer.dart';
import 'package:flutterprojects/widget/itemWidget.dart';

import 'Models/catalogModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final List dummyList=List.generate(5,(index)=>CatalogModel.courses[0]);
  // final int days=30;
  // final String name="dream code";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Skill Share"),
     ),
     body:Padding(
       padding: const EdgeInsets.all(10.0),
       child:Column(
         children: [
      Text("Welcome to Career Discovery", style: TextStyle(fontSize: 25),),
           SizedBox(height: 10,),
           Expanded(
             child:(CatalogModel.courses.isNotEmpty)?
      GridView.builder(
        itemCount: CatalogModel.courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
          itemBuilder: (context, index){
          final item=CatalogModel.courses[index];
            return Column(children:[
             Card(
              clipBehavior: Clip.antiAlias,
              child: GridTile(
                  child: Image.network(item.image, fit: BoxFit.cover, height: 80, width: 120,)
              ),
            ),
              SizedBox(height:10),
              Text(item.name),
            ]);
          })
           : Center(
         child: CircularProgressIndicator(),
       ),
     ),
         ],
       )
     ),

     drawer:MyDrawer(),
     );

  }

  void loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson=await rootBundle.loadString("assets/files/courses.json");
    final decodeData=jsonDecode(catalogJson);
    var coursesData=decodeData["courses"];
setState(() {
  CatalogModel.courses=List.from(coursesData).map<Course>((course)=>Course.fromMap(course)).toList();
  print(CatalogModel.courses);
});
  }
}