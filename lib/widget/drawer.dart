
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
const MyDrawer({super.key});
final String imageUrl="";
final String imagePath="assets/images/login.jpg";
@override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary
                ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              children: [
                               CircleAvatar(
                            radius: 30,
                                      backgroundImage:imageUrl.isEmpty?(imagePath.isEmpty? AssetImage(imagePath):null):null,
                                      child: Icon(Icons.person, size: 40, color: Theme.of(context).colorScheme.primary,),
                                    ),
                              SizedBox(height: 10,),

                              Text("Sapna", style: TextStyle(color: Colors.white),),
                                SizedBox(height: 5,),
                              Text("sapna@gmail.com", style: TextStyle(color: Colors.white)),
                              ], ),
                          ),
                        ),
                      ),

              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),ListTile(
              leading: Icon(Icons.category),
              title: Text("Catalog"),
            ),
          ],
        ),

    );
  }
}