import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/components/recipe_category_view.dart';
import 'package:recipeapp/constants/category_list.dart';
import 'package:recipeapp/screens/all_recipe.dart';

class RecipeCtaegory extends StatelessWidget {
  const RecipeCtaegory({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return  Scaffold(
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: w*.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h*.06,),
            Text("For You ",style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: w*.06),),
            SizedBox(height: h*.01,),
            SizedBox(height: h*.106,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCategoryView(name:"Breakfast" ,image:"assets/breakfast1.png" ,)
                ,RecipeCategoryView(name:"Lunch" ,image:"assets/breakfast1.png" ,)
                ,RecipeCategoryView(name:"Dinner" ,image:"assets/breakfast1.png" ,)
                ,RecipeCategoryView(name:"Supper" ,image:"assets/breakfast1.png" ,)
              ],
            ),
            ),
            SizedBox(
              height: h*.01,
            ),
            Text("For You ",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: w*.055),),
            SizedBox(
              height: h*.45,
              child: GridView.builder(
                itemCount: categories.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    crossAxisSpacing: h*.01,
                    mainAxisSpacing: w*.021
                  ),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AllRecipe(recipe: categories[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h*.043,
                              width: w*.08,
                              child: Image.asset("assets/breakfast1.png"),
                            ),
                            SizedBox(height: h*.003,),
                            Text(categories[index],style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45
                            ),),

                          ],
                        ),),
                      ),
                    );
                  }),
            ),
            Text("Your Preference",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w*.055
            ),),
            SizedBox(height: h*.12,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCategoryView(name:"Easy", image:"assets/breakfast2.png" ),
                RecipeCategoryView(name:"Quick", image:"assets/breakfast2.png" ),
                RecipeCategoryView(name:"Beef", image:"assets/breakfast2.png" ),
              ],
            ),),
            

          ],
        ),
      ) ,
    );
  }
}
