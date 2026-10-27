import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojects/Models/catalog.dart';
import 'package:flutterprojects/widget/custom_app_bar.dart';
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
  String selectedCategory='All';
  String searchQuery="";
  final List<String> categories=[
   'All',
   'Mobile Development',
   'Web Design',
   'Creative' ,
    'AI'
  ];
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
     body: DefaultTabController(
         length: categories.length,
         child: Builder(
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
                  CustomAppBar(
                    title: 'Skill Share',
                    actionIcon: Icons.notifications_none,
                    onActionTap: () {
                      // Open notifications page
                    },
                    onMenuTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
Text("Welcome to smart Career Discovery", style: TextStyle(fontSize: 30,),),

                  SizedBox( height: 40,
                    child: SearchBar(
                       hintText: "Search..",
                      elevation: WidgetStatePropertyAll(.5),
                      onChanged: (value){
                         setState(() {
                           selectedCategory=categories[DefaultTabController.of(context).index];
searchQuery=value;
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
  child: Column(
        children: [
    TabBar(
      tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        isScrollable: true,
          dividerColor: Colors.transparent,
          tabs: categories.map((category){
          return  Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Text(category),
            ),
          );
          }).toList(),
      ),
                 Expanded(child:
                 TabBarView(
                     children: categories.map((category) {
                       final categoryList = category == 'All'
                           ? CatalogModel.courses
                           : CatalogModel.courses
                           .where((p) => p.category == category)
                           .toList();
                       final filteredCourses=categoryList.where((p)=>p.name.toLowerCase()
                           .contains(searchQuery.toLowerCase())).toList();
                     //  selectedCategory=category;
                      return (filteredCourses.isNotEmpty) ?
                         ListView.builder(
                             itemCount: filteredCourses.length,
                             itemBuilder: (context, index) =>
                                 ItemWidget(item: filteredCourses[index])
                         )
                             : Center(
                           child: CircularProgressIndicator(),
                         );


                     }).toList(),  //children ends
                 )
                 )
                  ],
                 )
  //),
),
                ],
               ),
             ),
           )
         )
     ),
     ), // DefaultTabController ends
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