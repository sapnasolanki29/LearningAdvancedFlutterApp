import 'package:flutter/material.dart';

class CategoryTabBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;
  const CategoryTabBar({
    super.key,required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index){

        },
      ),
    );
  }
}
