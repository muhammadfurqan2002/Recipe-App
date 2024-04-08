import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/components/custome_app_bar.dart';
import 'package:recipeapp/constants/constant_function.dart';
import 'package:recipeapp/screens/detail_screen.dart';

class AllRecipe extends StatelessWidget {
  final String recipe;
  const AllRecipe({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:CustomAppBar(title:recipe,back: true,),
      body: FutureBuilder(
        future: ConstantFunction.getResponse(recipe),
        builder: (context,snapshot){
            if(!snapshot.hasData){
              return const Center(child: Text("no data"),);
            }else if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }else{
              return Padding(
                  padding:EdgeInsets.only(right: w*.034,left: w*.034,top: h*.03),
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 4,

                        childAspectRatio: .7/1,
                        crossAxisCount: 2),
                    itemBuilder: (context,index){
                      Map<String,dynamic> snap=snapshot.data![index];
                      int time=snap['totalTime'].toInt();
                      return Container(
                        // color: Colors.black,
                        // height: ,
                        child: Column(
                          children: [
                                  Expanded(
                                      flex: 3,
                                      child: Stack(children: [
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailScreen(item: snap)) );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              // height: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(snap['image']))
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 15,left: 10,
                                            child: Container(
                                              height: 20,width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(child: Text("$time min",style:const TextStyle(
                                                color: Colors.white,
                                              ),),),
                                            ))
                                  ],)),
                            Expanded(
                                flex: 1,
                                child:Padding(padding:const EdgeInsets.only(
                                  top: 8,left: 8,
                                ),
                                  child: Text(snap['label'],style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                ))
                          ],
                        ),
                      );

                    }),
              );
            }
          },
      ),
    );
  }
}
