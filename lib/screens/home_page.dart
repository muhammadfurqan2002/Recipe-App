import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/components/tab_bar_widget.dart';

import '../components/home_app_bar.dart';
import '../components/text_field_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  const HomeAppBar(),
                SizedBox(height: h *0.022,),
                const TextFieldWidget(),
                const SizedBox(height:5,),
                Container(
                  height: h*.25,
                  width: w,
                  decoration: BoxDecoration(
                    image:const DecorationImage(image:AssetImage('assets/home_page.png'),fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: h*.022,),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: TextStyle(
                      fontSize: w*.045,
                      fontWeight: FontWeight.bold,
                    ),),
                    const Text("see all",),
                  ],
                ),
                SizedBox(height: h*.022,),
                TabBarWidget(),
              ],
            ),
          ),

        )
      ),
    );
  }
}
