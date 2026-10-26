
import 'package:flutter/material.dart';
import 'package:flutterprojects/Providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget{
const MyDrawer({super.key});
@override
  Widget build(BuildContext context) {
  final user=context.watch<UserProvider>().user;
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
                                 backgroundColor: Colors.white,
                            radius: 30,
                                      backgroundImage:
                                       (user?.image?.isNotEmpty ?? false)?NetworkImage(user!.image!):null,
                                      child: Icon(Icons.person, size: 40, color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                              SizedBox(height: 10,),

                              Text(user?.name??"Guest", style: TextStyle(color: Colors.white),),
                                SizedBox(height: 5,),
                              Text(user?.email??"guest@gmail.com", style: TextStyle(color: Colors.white)),
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