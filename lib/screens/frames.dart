
import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double width = size.width;
    final double height = size.height;
    
    //starting point
    path.moveTo(width / 2, height * 0.35);
    // left half of the heart 
    path.cubicTo(
      0, height * 0.1,         
      0, height * 0.6,         
      width / 2, height,       
    );
    // right half of the heart 
    path.cubicTo(
      width, height * 0.6,     
      width, height * 0.1,     
      width / 2, height * 0.35 
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}


//circle shape
class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = centerX < centerY ? centerX : centerY;
    path.addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));
    return path; 
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//square shape
class SquareClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final squareSize = size.width < size.height ? size.width : size.height;
    path.addRect(Rect.fromLTWH(0, 0, squareSize, squareSize));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//rectangle shape
class RectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.width/1.5); 
    path.lineTo(size.width, size.width/1.5); 
    path.lineTo(size.width, 0); 
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}