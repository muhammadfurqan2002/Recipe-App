import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipeapp/components/circular_button.dart';
import 'package:recipeapp/components/custom_clip_path.dart';
import 'package:recipeapp/components/ingredient_list.dart';
import 'package:recipeapp/components/show_detailDialog.dart';
import 'package:recipeapp/components/show_table.dart';
import 'package:recipeapp/constants/share.dart';
import 'package:recipeapp/constants/start_cooking.dart';


class DetailScreen extends StatefulWidget {
  final Map<String,dynamic> item;
  const DetailScreen({super.key,required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    final time=widget.item['totalTime'].toString();
    var myBox=Hive.box("saved");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body:SingleChildScrollView(
        child: Column(
          children: [
              Stack(
                children: [
                  Container(
                    height: h*.44,
                    decoration:BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.item['image']),
                      )
                    ),
                  ),
                  Positioned(
                    top: h*.04,left: w*.05,
                      child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  )),
        
                ],
              ),
            Padding(padding: EdgeInsets.symmetric(horizontal: w*.04)
              ,child: Column(
                children: [
                  const SizedBox(height:20,),
                  Text(widget.item['label'],style: TextStyle(
                    fontSize: w*.05,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),),
                  const SizedBox(height:1,),
                  Text("$time"),
                  SizedBox(height: h*.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          ShareRecipe.share(widget.item['url']);
                        },        
                          child:const CircularButton(icon: Icons.share, label: "Share")),

                      ValueListenableBuilder(valueListenable: myBox.listenable(),
                          builder: (context,box,_){
                                String key=widget.item['label'];
                                if(myBox.containsKey(key)){
                                  return GestureDetector(
                                      onTap: (){
                                        myBox.delete(key);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Text("Recipe deleted")));
                                      },
                                      child: const CircularButton(icon: Icons.bookmark ,label: "Saved"));

                                }else{
                                 return GestureDetector(
                                     onTap: (){
                                       myBox.put(key,key);

                                       ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(
                                               duration: Duration(seconds: 1),
                                               content: Text("Recipe saved successfully")));
                                     },
                                     child: const CircularButton(icon: Icons.bookmark_border ,label: "Save"));
                                }
                          }),
                      GestureDetector(
                          onTap: (){
                            ShowDetailDialog.showCalories(widget.item['totalNutrients'], context);
                          }, child:const CircularButton(icon: Icons.monitor_heart_outlined, label: "Calories")),
                      GestureDetector(
                          onTap: (){
                                  ShowTable.showTable(context);
                          },
                          child: const CircularButton(icon: Icons.table_chart_outlined, label: "unit_chart")),
                    ],
                  ),
                  SizedBox(height: h*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Direction",style: TextStyle(
                          fontSize: w*.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                      SizedBox(width: w*.34,
                      child: ElevatedButton(
                        onPressed: (){
                              StartCooking.startCooking(widget.item['url']);
                        },
                        child:const Text("Start") ,
                      ),),
        
                    ],
                  ),
                SizedBox(height: h*.02,),
                  Container(
                    color: Colors.white,
                    height: h*.07,
                    width: w,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                color: Colors.redAccent,
                                child: Center(child: Text("Ingredient Required",style: TextStyle(
                                    fontSize: w*.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),),),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.white,
                              child: Center(child: Text(" 6\nItems"),),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height:h*1.8,
                    child: IngredientList(ingredients: widget.item['ingredients']),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
