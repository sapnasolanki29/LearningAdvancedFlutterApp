import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojects/Models/catalog.dart';
import 'package:flutterprojects/widget/drawer.dart';
import 'package:flutterprojects/widget/itemWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Models/catalogModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Course> filteredList=[];
  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
   return
     Scaffold(
     drawer:MyDrawer(),
     // appBar: AppBar(
     //   title: Text("Catalog App"),
     // ),
     body:Builder(
         builder: (context) =>
     Container(
           decoration:  BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [
                 Theme.of(context).colorScheme.primaryContainer, // Light green gradient
                 Color(0xFFF8F9FA), // White / Light grey
               ],
             ),
           ),
           child:
           SafeArea(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 spacing: 10,
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Row(// App Bar
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(// starting title
                     spacing: 10,
                     children: [
               GestureDetector(
                 onTap: (){
                   Scaffold.of(context).openDrawer();
                 },
                 child: Icon(Icons.menu,),
               ),
                       Text("Skill Share",style:TextStyle(fontSize:15,fontWeight: FontWeight.bold), )
                     ],
                   ),
                   Container(// end action button for notification
                     decoration: BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle
                     ),
child: Padding(
  padding: const EdgeInsets.all(1.0),
  child: Icon(Icons.notifications_none, ),
)
                   )
                 ],
               ),
Text("Welcome to smart Career Discovery", style: TextStyle(fontSize: 30,),),

                  SizedBox( height: 40,
                    child: SearchBar(
                       hintText: "Search..",
                      elevation: WidgetStatePropertyAll(.5),
                      onChanged: (value){
                         setState(() {
                         filteredList=CatalogModel.courses.where((a)=>a.name.contains(value)).toList();
                         });
                         },
                      onSubmitted: (value){ },

                      trailing:[ Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFF284A16),
                          size: 20,

                        ),
                      )]
                    ),
                  ),

                      Expanded(
                        child:(filteredList.isNotEmpty)?
                        ListView.builder(
               itemCount: filteredList.length,
                 itemBuilder: (context,index)=>
                 ItemWidget(item: filteredList[index])
                        )
                 : Center(
                        child: CircularProgressIndicator(),
                   ),
                      )

                ],
               ),
             ),
           )
         )
     ),
     );


  }

  void loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson=await rootBundle.loadString("assets/files/courses.json");
    final decodeData=jsonDecode(catalogJson);
    var coursesData=decodeData["courses"];
setState(() {
  filteredList=CatalogModel.courses=List.from(coursesData).map<Course>((course)=>Course.fromMap(course)).toList();
  print(CatalogModel.courses);
});
  }
}