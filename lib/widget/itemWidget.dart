import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Course item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      // child: ListTile(
      //   leading:Image.network(item.image, fit: BoxFit.cover, width: 60,),
      //   title:Text( item.name, style: TextStyle(fontWeight: FontWeight.bold),),
      //   subtitle: Text(item.desc, style: TextStyle(color: Colors.black54),),
      //
      // ),
     child: Padding(
       padding: const EdgeInsets.all(10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text( item.name, style: TextStyle(fontWeight: FontWeight.bold),),
       Container(// end action button for notification
         decoration: BoxDecoration(
             shape: BoxShape.circle
         ),
         child: Padding(
           padding: const EdgeInsets.all(1.0),
           child: Icon(Icons.more_vert_outlined, size: 20, ),
         )
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
