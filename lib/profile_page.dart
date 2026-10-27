import 'package:flutter/material.dart';
import 'package:flutterprojects/widget/custom_app_bar.dart';
import 'package:flutterprojects/widget/drawer.dart';
import 'package:provider/provider.dart';

import 'Providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer:MyDrawer(),
        body: Builder(
            builder: (context) =>
      Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.secondaryContainer, // Light green gradient
              Color(0xFFF8F9FA), // White / Light grey
            ],
          ),
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CustomAppBar(
                title: 'My Profile',
                actionIcon: Icons.notifications_none,
                onActionTap: () {
                  // Open notifications page
                },
                onMenuTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 40, color: Theme.of(context).colorScheme.primary,),
                        ),
                        SizedBox(height:5,),
                        Text(context.watch<UserProvider>().user?.name??"Guest", style: TextStyle(fontSize: 20),),
                        SizedBox(height: 0,),
                        Text(context.watch<UserProvider>().user?.email??"guest@gmail.com", style: TextStyle(fontSize: 14),),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          spacing: 10,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("10", style: TextStyle(fontSize: 20),),
                                    Text("Courses", style: TextStyle(fontSize: 12),),

                                  ],
                                ),

                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("8", style: TextStyle(fontSize: 20),),
                                    Text("Completed", style: TextStyle(fontSize: 12),),

                                  ],
                                ),

                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("24h", style: TextStyle(fontSize: 20),),
                                    Text("Learning", style: TextStyle(fontSize: 12),),

                                  ],
                                ),

                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text("Personal Information",style: TextStyle(fontWeight: FontWeight.bold),),
                            //SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    child: Row(
                      children: [
                        Text("Address: ${context.watch<UserProvider>().user?.address}")
                      ],
                    ),
                    ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Text("Profession: ${context.watch<UserProvider>().user?.profession}")
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Text("Mobile: ${context.watch<UserProvider>().user?.mobile}")
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Text("Address: ${context.watch<UserProvider>().user?.address}")
                                ],
                              ),
                            ),
                           SizedBox(height: 5,),
                           Row( spacing: 3, children: [
                             Icon(Icons.logout, color: Colors.red, size: 20,),
                             Text("Logout", style: TextStyle(color: Colors.red),),
                           ] )
                          ],
                        )
                        // ElevatedButton(onPressed: (){
                        //   context.read<UserProvider>().setUser(null);
                        // }, child: Text("Logout"))
                      ],
                    ),
                  )


                ],
              ),
            )
        )
    ),
        )
    );
  }
}
