import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
          width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
                child: Container(
                    width: w,
                  height: h*.81,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/onboard.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
            )),
            const Center(
              child: Icon(Icons.emoji_food_beverage_outlined,size: 100,color: Colors.white,),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: h*.240,
                    width: w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)
                        
                      ),
                    ),
                  child: Padding(
                    padding: EdgeInsets.only(top:h*.032),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Let's cook good food",style: TextStyle(
                            fontSize: w*.06,
                            fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(height: h*0.01,),
                          const Text("Check out the app and start cooking delicious meals!",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),),
                          const SizedBox(height: 0.045,),
                          SizedBox(
                            width: w*.8,
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              }, child: const Text("Get Started",
                            style: TextStyle(
                              color: Colors.black
                            ),
                            ),
                              
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
