import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Favorites/bloc/favorite_event.dart';
import 'package:flutterprojects/Favorites/bloc/favorite_state.dart';

import '../Favorites/bloc/favorite_bloc.dart';
import '../Models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Course item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
     child: Padding(
       padding: const EdgeInsets.all(10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text( item.name, style: TextStyle(fontWeight: FontWeight.bold),),
       BlocBuilder<FavoriteBloc,FavoriteState>(
         builder: (context, state) {
           final isSaved=state.isFavorite(item);
           return InkWell(
             onTap: (){
context.read<FavoriteBloc>().add(
  ToggleFavorite(item),
);
             },
             child: Container(
               decoration: BoxDecoration(
                   shape: BoxShape.circle
               ),
               child: Padding(
                 padding: const EdgeInsets.all(1.0),
                 child:isSaved? Icon(Icons.bookmark, size: 20, )
                     :Icon(Icons.bookmark_outline, size: 20, )
               )
             ),
           );
         }
       )
             ],
           ),
           Row(
           children: [
           Text("Avg Salary:",),
       SizedBox(width: 10,),
        Text(item.avgSalary, style: TextStyle(fontSize: 20,),),

           ]),
           Row(
               children: [
                 Text("Demand:", ),
                 SizedBox(width: 10,),
                 Text(item.demand, style: TextStyle(
                     color:colorChanged(item.demand)
                     ),),

               ])
         ],


        ),
     ),
    );
  }

  Color? colorChanged(String demand) {
    switch(demand){
      case "High": return Colors.green;
      case "Med": return Colors.yellow;
      case "Low": return Colors.red;
      default: return Colors.black;
    }
  }
}
