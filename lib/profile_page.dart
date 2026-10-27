import 'package:flutter/material.dart';
import 'package:flutterprojects/widget/custom_app_bar.dart';
import 'package:flutterprojects/widget/drawer.dart';

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
                title: 'Skill Share',
                actionIcon: Icons.notifications_none,
                onActionTap: () {
                  // Open notifications page
                },
                onMenuTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
                ],
              ),
            )
        )
    ),
        )
    );
  }
}
