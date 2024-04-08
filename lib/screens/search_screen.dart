import 'package:flutter/material.dart';
import 'package:recipeapp/components/custome_app_bar.dart';
import 'package:recipeapp/components/text_field_widget.dart';
import 'package:recipeapp/screens/all_recipe.dart';

import '../constants/search_tags.dart';



class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title:'Search' ,back: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: h*.016,
          horizontal: w*.032
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(),
            SizedBox(height: h*.04,),
            Text("Search Tags",style: TextStyle(
              fontSize: w*.06,
              fontWeight: FontWeight.bold,
            ),),
            Wrap(
              spacing: 8,
              children:tags.map((label){
                return ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>AllRecipe(recipe: label)));
                },
                    child: Text(label));
              }).toList(),
            )

          ],
        ),
      ),
    );
  }
}
