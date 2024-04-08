import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int seletedItem;
  final Function(int)onTap;
  const BottomNavBar({super.key,required this.onTap,required this.seletedItem});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    // var widget;
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w*.015,vertical: h*.01),
        child:GNav(
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          tabBackgroundGradient: LinearGradient(
              colors: [
            Colors.blue[400]!,
            Colors.blueAccent.shade700,
          ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          iconSize: 27,
          textSize: 18,
          padding: EdgeInsets.symmetric(horizontal: w*.01,vertical: h*.01),
          tabs:const [
            GButton(icon: CupertinoIcons.home,text:'Home',),
            GButton(icon:Icons.category,text:'Categories',),
            GButton(icon: CupertinoIcons.search,text:'Search',),
            GButton(icon: CupertinoIcons.bookmark_solid,text:'Saved',),
            GButton(icon: CupertinoIcons.bag,text:'Shopping',),
          ],
          onTabChange: onTap,
          selectedIndex: 0,
        ),
      ),
    );
  }
}
