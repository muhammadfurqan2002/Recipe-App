import 'package:flutter/material.dart';

import 'ingredient_item.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientList({super.key,required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ingredients.length,
        physics: ScrollPhysics(
          parent: NeverScrollableScrollPhysics()
        ),
        itemBuilder: (context ,index){
        int quantity=ingredients[index]['quantity'].toInt()??1;
          return IngredientItem(
            quantity: quantity.toString(),
            measure:ingredients[index]['measure']??'' ,
            imageUrl:ingredients[index]['image']??'' ,
            food: ingredients[index]['food']??'',
          );
    });
  }
}
