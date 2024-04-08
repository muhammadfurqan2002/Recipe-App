import 'package:flutter/material.dart';
import 'package:recipeapp/components/bottom_vaigator_bar.dart';
import 'package:recipeapp/screens/home_page.dart';
import 'package:recipeapp/screens/recipe_category.dart';
import 'package:recipeapp/screens/saved_scree.dart';
import 'package:recipeapp/screens/search_screen.dart';
import 'package:recipeapp/screens/shopping_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController=PageController();
  int currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
       onTap: (index) {
         pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          setState(() {
            currentIndex=index;
          });
       },
        seletedItem: currentIndex,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },
        physics:const NeverScrollableScrollPhysics(),
        children:const [
          HomePage(),
          RecipeCtaegory(),
          SearchScreen(),
          SavedScreen(),
          ShoppingScreen()
        ],
      ),
    );
  }
}
