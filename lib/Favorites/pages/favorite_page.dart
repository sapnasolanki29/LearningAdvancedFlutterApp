import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Favorites/bloc/favorite_state.dart';
import 'package:flutterprojects/widget/itemWidget.dart';

import '../bloc/favorite_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favorite Courses'),),
        body:   BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context,state){
        final favorites=state.favorites;
        if(favorites.isEmpty){
          return const Center(
            child: Text('No favorite courses'),
          );
        }
        return ListView.builder(
          itemCount: favorites.length,
            itemBuilder: (context,index){
              final course=favorites[index];
              return ItemWidget(item: course);
            }
            );
      },
    )
    );
  }
}

