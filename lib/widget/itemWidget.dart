import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Course item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:Image.network(item.image, fit: BoxFit.cover, width: 60,),
        title:Text( item.name),
        subtitle: Text(item.desc),
      
      ),
    );
  }
}
