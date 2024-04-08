
import 'package:flutter/material.dart';


class CustomClipPath extends CustomClipper<Path>{

  Path getClip(Size size){
      Path path=Path();
      path.lineTo(0, 500);
      path.lineTo(size.width, 0);
      path.close();
      return path;
  }
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}